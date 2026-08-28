#!/usr/bin/env bash
set -euo pipefail

usage() {
  printf '%s\n' \
    'Usage: export_logo_assets.sh --mark PATH --out DIR --slug NAME [--background COLOR] [--force]' \
    '' \
    'Exports a deterministic icon suite from an approved transparent mark master.' \
    'It does not create, redraw, or modify the logo design.'
}

mark_path=''
out_dir=''
brand_slug=''
background_color='#0a0a09'
force_output='false'

while (($#)); do
  case "$1" in
    --mark) mark_path="${2:-}"; shift 2 ;;
    --out) out_dir="${2:-}"; shift 2 ;;
    --slug) brand_slug="${2:-}"; shift 2 ;;
    --background) background_color="${2:-}"; shift 2 ;;
    --force) force_output='true'; shift ;;
    -h|--help) usage; exit 0 ;;
    *) printf 'Unknown argument: %s\n' "$1" >&2; usage >&2; exit 2 ;;
  esac
done

if [[ -z "$mark_path" || -z "$out_dir" || -z "$brand_slug" ]]; then
  usage >&2
  exit 2
fi

if [[ ! -f "$mark_path" ]]; then
  printf 'Mark source not found: %s\n' "$mark_path" >&2
  exit 1
fi

if ! command -v magick >/dev/null 2>&1 || ! command -v identify >/dev/null 2>&1; then
  printf '%s\n' 'ImageMagick commands `magick` and `identify` are required.' >&2
  exit 1
fi

if [[ ! "$brand_slug" =~ ^[a-z0-9][a-z0-9-]*$ ]]; then
  printf '%s\n' 'Slug must contain lowercase letters, digits, and hyphens only.' >&2
  exit 2
fi

mkdir -p "$out_dir"
if [[ "$force_output" != 'true' ]] && [[ -n "$(find "$out_dir" -mindepth 1 -print -quit)" ]]; then
  printf 'Output directory is not empty: %s (use --force to overwrite generated names)\n' "$out_dir" >&2
  exit 1
fi

channels="$(identify -quiet -format '%[channels]' "$mark_path")"
case "$channels" in
  *a*|*A*) ;;
  *)
    printf '%s\n' 'The supplied mark has no alpha channel. Restore a truly transparent master before export.' >&2
    exit 1
    ;;
esac

has_transparent_pixels="$(identify -quiet -format '%[fx:minima.a<1?1:0]' "$mark_path")"
if [[ "$has_transparent_pixels" != '1' ]]; then
  printf '%s\n' 'The supplied mark has an alpha channel but no transparent pixels. Remove the baked background before export.' >&2
  exit 1
fi

temp_dir="$(mktemp -d)"
trap 'rm -rf "$temp_dir"' EXIT

source_copy="$out_dir/${brand_slug}-mark-source.png"
master_path="$out_dir/${brand_slug}-mark-master.png"

magick "$mark_path" -auto-orient -strip "$source_copy"
magick "$mark_path" -auto-orient -trim +repage -resize '1120x1120>' \
  -background none -gravity center -extent 1400x1400 -strip "$master_path"

sizes=(16 32 48 64 128 180 192 256 512 1024)
for size in "${sizes[@]}"; do
  magick "$master_path" -filter Lanczos -resize "${size}x${size}" \
    -strip "$out_dir/${brand_slug}-mark-${size}.png"
done

magick \
  "$out_dir/${brand_slug}-mark-16.png" \
  "$out_dir/${brand_slug}-mark-32.png" \
  "$out_dir/${brand_slug}-mark-48.png" \
  "$out_dir/favicon.ico"

make_opaque_icon() {
  local canvas_size="$1"
  local artwork_size="$2"
  local output_path="$3"
  magick -size "${canvas_size}x${canvas_size}" "xc:${background_color}" \
    \( "$master_path" -resize "${artwork_size}x${artwork_size}" \) \
    -gravity center -composite -strip "$output_path"
}

make_opaque_icon 180 162 "$out_dir/apple-touch-icon.png"
make_opaque_icon 192 172 "$out_dir/icon-192.png"
make_opaque_icon 512 460 "$out_dir/icon-512.png"
make_opaque_icon 512 384 "$out_dir/icon-maskable-512.png"

printf 'Generated logo asset suite in %s\n' "$out_dir"
identify -quiet -format '%f | %wx%h | %[channels]\n' "$out_dir"/*
