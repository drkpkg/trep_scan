# trep_scan
Buscando irregularidades del trep

## Requisitos previos
- sudo apt-get install libimage-exiftool-perl
- ruby 2.6.3 (Usar rvm o rbenv)
- bundle install

## Como hacerlo funcionar
`ruby exif.rb mesas folder`

`mesas` es la lista de actas cada una separada por un salto de linea

`folder` es opcional, por lo general toma la carpeta actual donde deberian las imagenes, sino el path deberia resolverse agregando ese argumento

