default:
    @just --list

# preview web docs
quarto-preview port="6660":
    @quarto preview --port {{ port }}

# render docs for distribution and hosting
quarto-render:
    @quarto render

lint args="":
    @treefmt {{ args }} --config-file ./treefmt.lint.toml

format args="":
    @treefmt {{ args }} --config-file ./treefmt.toml
