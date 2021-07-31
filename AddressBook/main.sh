#! /bin/sh

search_data(){
	if [ -f  database ]
	then
		echo Enter name to search:-
	       	read data
		echo Name "     "  Address "    "  PhoneNumber
		grep $data database	


	else
		echo Sorry!!!...Database not exists...
		echo Creating database...
		touch database
		echo Database has been created
	fi

}

insert_data(){
	if [ -f database ]
	then
		
		echo Enter name:- 
		read name
		echo Enter address:- 
		read address
		echo Enter phone number:- 
		read phoneNum
		echo $name " " $address " " $phoneNum >>database
       		echo Data inserted successfully
	else
		echo Ceating database
		touch database
		echo Datebase ceated successfully
	fi	

}

remove_data(){
	echo Enter name to delete the data:- 
	read datatodelete
	sed  -i.bak "/$datatodelete/d" ./database
	echo Data Successfully deleted...
}

get_input(){
	INPUTDATA=$1
	echo You have choosen option $INPUTDATA.... 		
	if [ $INPUTDATA -eq 1 ]
	then
		search_data
	elif [ $INPUTDATA -eq 2 ]
	then
		insert_data
	elif [ $INPUTDATA -eq 3 ]
	then
		remove_data
	elif [ $INPUTDATA -eq 4 ]
	then
		display_data
	else
		echo Invalid Input...Bye!!
	fi	

}

display_data(){
	if [ -f database ]; then
		echo Name  "           "        Address   "              "        Phone Number
		cat database
	else
		echo No database exists to display
	fi
}

while :
do
	echo Select any one option:-
	echo "1> Search data from address"
	echo "2> Add entries"
	echo "3> Remove entries"
	echo "4> Display all data from database"

	read input

	if [ -z $input ]
	then
		echo "Please enter a value......"
	else
        	get_input $input
	fi
done	

