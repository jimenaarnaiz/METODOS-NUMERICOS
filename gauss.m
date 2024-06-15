function X = gauss(A, B)
% Esta función resuelve un sistema de ecuaciones lineales utilizando el método de eliminación gaussiana
% con una matriz de términos independientes para resolver al mismo tiempo varios sistemas.
%
% Entradas:
%   A: matriz cuadrada de coeficientes del sistema de ecuaciones.
%   B: vector columna de resultados de cada ecuación.
%
% Salida:
%   X: vector con los valores para todas las variables del sistema de ecuaciones.
%
% x = gauss(matrizA, matrizB)

% Protección contra errores en las entradas
if nargin ~= 2                 
    error('Se debe ingresar una matriz cuadrada A y un vector columna B');
else                          
    if size(A,1) ~= size(A,2)
        error('Se necesita que la matriz A sea cuadrada')
    elseif size(B,1) ~= size(A,1)
        error('El número de filas de A no coincide con el de B. Sistema inconsistente');
    end
end

% Eliminación hacia adelante
for fila_pivote = 1:size(A,1) - 1
    if A(fila_pivote,fila_pivote) == 0
        % Buscar un elemento no cero debajo del pivote
        fila_no_cero = find(A(fila_pivote+1:end,fila_pivote), 1) + fila_pivote;
        if isempty(fila_no_cero)
            % Si no se encuentra ningún elemento no cero, pasar a la siguiente columna
            continue;
        else
            % Intercambiar filas fila_pivote con fila_no_cero
            A([fila_pivote,fila_no_cero],:) = A([fila_no_cero,fila_pivote],:);
            B([fila_pivote,fila_no_cero],:) = B([fila_no_cero,fila_pivote],:);
        end
    end
    for fila = fila_pivote + 1:size(A,1)
        if A(fila,fila_pivote) ~= 0 % Si no hay un cero en este elemento, hacer eliminación
            factor = A(fila,fila_pivote)/A(fila_pivote,fila_pivote);
            A(fila,:) = A(fila,:) - factor*A(fila_pivote,:);
            B(fila,:) = B(fila,:) - factor*B(fila_pivote,:);
        else
            continue % Si hay un cero, saltarse al siguiente elemento
        end
    end
end

% Sustitución hacia atrás
X = zeros(size(B));
X(end,:) = B(end,:)/A(end,end); % Calculamos la última incógnita
for fila = size(A,1) - 1:-1:1
    suma = B(fila,:);
    for columna = fila + 1:size(A,1)
        suma = suma - A(fila,columna)*X(columna,:);
    end
    X(fila,:) = suma/A(fila,fila);
end

end
