import sys

matrix=[01,02,03,04,05,06,07,8,
	11,12,13,14,15,16,17,18,
	21,22,23,24,25,26,27,28,
	31,32,33,34,35,36,37,38,
	41,42,43,44,45,46,47,48,
	51,52,53,54,55,56,57,58,
	61,62,63,64,65,66,67,68,
	71,72,73,74,75,76,77,78]

temp_matrix=matrix
new_matrix=[]
while temp_matrix!=[]:
	new_matrix.append(temp_matrix[:8])
	temp_matrix=temp_matrix[8:]

for i in new_matrix:
	print '{}'.format(i)

print '\n'

var0=input("Enter value at [0][0] : ")
var1=input("Enter value at [0][1] : ")
var2=input("Enter value at [1][0] : ")
var3=input("Enter value at [1][1] : ")
print '\n'

flag=False
for i in range(63):
	if var0==matrix[i] and var1==matrix[i+1] and var2==matrix[i+8] and var3==matrix[i+9]:
		print "matrix found at position : [{}][{}]".format(i/8,i%8)
		flag=True
		
if(flag==False):
	print ("matrix not found")
