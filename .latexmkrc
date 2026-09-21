# variableCompleja/.latexmkrc
add_cus_dep('glo', 'gls', 0, 'makeglossaries');
add_cus_dep('acn', 'acr', 0, 'makeglossaries');
$clean_ext .= ' acr acn alg glo gls glg';

sub makeglossaries {
    my ($base_name, $path) = fileparse( $_[0] );
    my @args = ("-q", "-d", $path, $base_name);
    if ($silent) { unshift @args, "-q"; }
    return system "makeglossaries", "-d", $path, $base_name;
}

# Crea las subcarpetas espejo dentro de build/, porque TeX no las genera solo
# cuando se usa \include con archivos en subdirectorios
system("mkdir -p build/indices build/chapters build/appendices");

# variableCompleja/.latexmkrc para compilar el proyecto variableCompleja solo desde main.tex, y no desde los archivos de subdirectorios. Esto es útil para evitar errores de compilación cuando se compila un archivo que depende de otros archivos que no están en el mismo directorio.
@default_files = ('main.tex');