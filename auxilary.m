function [atr,var] = auxilary()

sz = 200;

var = ["Class"];
atr = [];

for i = 1:sz
    var = [var; "T"];
end

for i = 1:sz
    var = [var; "F"];
end

for i = 1:36*13+1
    atr = [atr ("feature" + int2str(i))];
end

% csvwrite("atribute.csv", atr);

end

