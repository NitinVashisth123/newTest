public class DataTypes{
integer k;
double l;
long m;
string s;
Date todaysdate;
string[]arrayofproducts=new List<string>();

public void intializeDataTypes(){
k=10;
l=4.23;
m=3567263;
s='first code';
todaysdate=date.today();
arrayofproducts.add('Nitin');
arrayofproducts.add('Himanshu');
arrayofproducts.add('Sachin');
arrayofproducts.add('Priyanshu');
arrayofproducts.add('Neha');
arrayofproducts.add('Shubhi');
}

public void PrintDataType(){
system.debug('int****'+k);
system.debug('double****'+l);
system.debug('long****'+m);
system.debug('string****'+s);

system.debug('Todays date is****' +todaysdate);

for(string product:arrayofproducts){
system.debug('product****'+product);
}
}
}