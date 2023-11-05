set shell := ["bash", "-uc"]

default:
  @just --list

setup:
  pacman -S extra/clojure extra/leiningen

generate:
  mkdir -p things/open
  @echo "TYPE: (load-file \"src/dactyl_pivot/dactyl-open.clj\")"
  lein repl

# mkdir things/closed
# echo "(load-file \"src/dactyl_pivot/dactyl-closed.clj\")"
# mkdir things/light
# echo "(load-file \"src/dactyl_pivot/dactyl-light.clj\")"

stl:
  #!/usr/bin/env sh
  for file in `ls things/open/*.scad`; do
    OpenSCAD-2023.10.27.ai16657-x86_64.AppImage -q $file -o $file.stl
  done
# for file in `ls things/closed/*.scad`; do
#   OpenSCAD-2023.10.27.ai16657-x86_64.AppImage -q $file -o $file.stl
# done
# for file in `ls things/light/*.scad`; do
#   OpenSCAD-2023.10.27.ai16657-x86_64.AppImage -q $file -o $file.stl
# done