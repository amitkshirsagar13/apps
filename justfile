default:
  @just --list --unsorted

gpush message:
  git add . && git commit -m "{{message}}" && git push
