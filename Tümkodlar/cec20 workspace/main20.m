algorithms = { 'BMO','BMO_FDB_Case_1','BMO_FDB_Case_2','BMO_FDB_Case_3','BMO_FDB_Case_4','BMO_FDB_Case_5','BMO_FDB_Case_6','BMO_FDB_Case_7','BMO_FDB_Case_8','BMO_FDB_Case_9','BMO_FDB_Case_10','BMO_RFDB_Case_1','BMO_RFDB_Case_2','BMO_RFDB_Case_3','BMO_RFDB_Case_4','BMO_RFDB_Case_5','BMO_RFDB_Case_6','BMO_RFDB_Case_7','BMO_RFDB_Case_8','BMO_RFDB_Case_9','BMO_RFDB_Case_10'};%,'bsa','aso'};
 
dimension = 100; 
run = 25; 
maxFEs = 1000*dimension;
filename = 'result';
functionsNumber = 10;
solution = zeros(functionsNumber, run);
globalMins = [100, 1100, 700, 1900, 1700, 1600, 2100, 2200, 2400, 2500];
paths;
cec20so = str2func('cec20_func_so'); 
for ii = 1 : length(algorithms)
    disp(algorithms(ii));
    algorithm = str2func(char(algorithms(ii)));
    for i = 1 : functionsNumber
        disp(i);
        for j = 1 : run
            [bestSolution, bestFitness, iteration] = algorithm(cec20so, dimension, maxFEs, i);
            solution(i, j) = bestFitness - globalMins(i);
   
        end
    end
    xlswrite(strcat(filename, '-d=', num2str(dimension), '.xlsx'), solution, func2str(algorithm));
    eD = strcat(func2str(algorithm), '-Bitti :)');
    disp(eD);
end