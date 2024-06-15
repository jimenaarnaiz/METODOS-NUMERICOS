function comparacionRendimiento(A,B)

%   Esta función mide el tiempo de ejecución de la función
%   gauss(A, B) y de la función linsolve(A, B), y muestra los resultados.

% Medir el tiempo de ejecución de la función gaussInicial(A,B)
%tic;
%gaussInicial(A, B);
%t_gaussInicial = toc;
%


% Medir el tiempo de ejecución de la función gauss(A,B)
tic;
gauss(A, B);
t_gauss = toc;

% Medir el tiempo de ejecución de la función linsolve(A,B)
tic;
linsolve(A, B);
t_linsolve = toc;

% Mostrar resultados
%fprintf('Tiempo de ejecución de gaussInicial: %.6f segundos\n', t_gaussInicial);
fprintf('Tiempo de ejecución de gauss: %.6f segundos\n', t_gauss);
fprintf('Tiempo de ejecución de linsolve: %.6f segundos\n', t_linsolve);

end