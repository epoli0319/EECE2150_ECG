tbl = readtable('ecg1.csv');
A = table2array(tbl);
figure(1)
plot(A(:,2),A(:,3));

figure(2)
plot(A(:,2),A(:,3)/25);

