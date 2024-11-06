# Cargar los datos
data_values2 <- read.csv("DataValues_S013.csv", row.names = 1)
sample_info2 <- read.csv("DataInfo_S013.csv", row.names = 1)
metabolite_info2 <- read.csv("AAInformation_S006.csv", row.names = 1)


# Asegurarse de que las columnas de sample_info coincidan con las columnas de data_values
sample_info2 <- sample_info2[match(colnames(data_values2), rownames(sample_info2)), ]
# Asegurarse de que las filas de metabolite_info coincidan con las filas de data_values
metabolite_info2 <- metabolite_info2[match(rownames(data_values2), rownames(metabolite_info2)), ]

sample_info2 <- sample_info2[rownames(sample_info2) %in% rownames(data_values2), ]
metabolite_info2 <- metabolite_info2[rownames(metabolite_info2) %in% colnames(data_values2), ]
# Crear el objeto SummarizedExperiment si las dimensiones coinciden


# Verificar dimensiones de los datos
print(dim(data_values))         # Dimensiones de la matriz de abundancia
print(dim(sample_info))         # Dimensiones de la información de muestras
print(dim(metabolite_info))     # Dimensiones de la información de metabolitos



se2 <- SummarizedExperiment(
  assays = list(counts = as.matrix(data_values2)),
  colData = sample_info2,
  rowData = metabolite_info2)


