#! /big/bash

function userAdd(){
    read -r -p "Do you want add user y/n? " chocie
     if [[ $choice == y || $chocie -eq yes ]]; then
             exit=true
    while [[ $exit == true ]]
    do
        echo -e "1. Enter user name\n2.Name + uid\n3. Add password to user and uid\n9. Exit"
        read item
        case $item in
        1)  read -r -p "Enter user name: " user
        useradd $user
        if [[ $? != 0 ]]; then
            echo "$?"
            echo "Eroror user already exists"
        else 
            echo "Nema complited"
            fi
        ;;
        2) 
        read -r -p "U id " id
        read -r -p "Name uid " user
         usermod -u $id $user
        if [[ $? != 0 ]]; then
            echo "$?"
            echo "Eroror user already exists"
        else 
            echo "id complited"
        fi
        ;;
        3)
        read -r -p "Add password to user and uid " user
        passwd $user
        if [[ $? != 0 ]]; then
            echo "$?"
            echo "Eroror user already exists"
        else 
            echo "password complited"

            fi 
        ;;
        9) exit=false
           echo "Good bay";;
        *) echo "Eroor invalid item"
            exit 1
        esac
    done
    else
       echo "Good bay"
    fi
   # fi
}
function Deleteuser(){
 read -r -p "Do you want delete add y/n? " choice
    if [[ $choice == y ]]; 
    then
      read -r -p "Enter user name: " user
       userdel -r $user
            echo "User complited"
     else
        echo "Good bay"
    fi
}
#3
function Edituser(){
   # read -r -p "Do you want edit user? " choice
    #if [[ $choice == y ]];
     #then
         exit=true
    while [[ $exit == true ]]
    do
        echo -e "1. Edit user\n2. Edit uid\n3. Edit new password\n9. Exit"
        read item
        case $item in
        1) read -r -p "Do you want edit user y/n? " choice
    if [[ $choice == y ]]; 
    then
          read -r -p "New user name: " user
        read -r -p "Enter user name: " user1
        usermod -l $user $user1
        
     else
        echo "Good bay"
    fi
        ;;
        2) read -r -p "Do you want add user y/n? " choice
    if [[ $choice == y ]]; 
    then
        
        read -r -p "New u id " id
        read -r -p "Name uid " user
         usermod -u $id $user
        if [[ $? != 0 ]]; then
            echo "$?"
            echo "Eroror user already exists"
        else 
            echo "id complited"
        fi
     else
        echo "Good bay"
    fi
        ;;
        3) read -r -p "Do you want edit password user y/n? " choice
    if [[ $choice == y ]]; 
    then
        read -r -p "New password user name: " user
       
        passwd $user 
        if [[ $? != 0 ]];
         then
            echo "$?"
            echo "Eroror user already exists"
        else 
            echo "password complited"
            fi 
        else
        echo "Good bay"
        fi
         ;;
        9) exit=false
            echo "Good bay";;
        *) echo "Eroor invalid item"
            exit 1
        esac
    done
    
    # else
     #   echo "Good bay"
      #  fi
        
}

#4
function Creategroup(){
     read -r -p "Create group y / n? " choice
    if [[ $choice == y ]]; 
    then
    read -r -p "Do you want add group? " group
    read -r -p "Do you want add group id? " id
    
        groupadd $group -g $id
        if [[ $? != 0 ]]; then
            echo "$?"
            echo "Eroror group already exists"
        else 
            echo "Group complited"
    
        fi
       
     else
        echo "Good bay"
    fi
   
}
#5
function Addusergroup(){
     read -r -p "Add user group y / n? " choice
    if [[ $choice == y ]]; 
    then
    read -r -p "Do you want add group? " group
    read -r -p "Do you want add user? " user
    
        usermod -aG $group $user
        if [[ $? != 0 ]]; then
            echo "$?"
            echo "Eroror group already exists"
        else 
            echo "Group complited"
    
        fi
       
     else
        echo "Good bay"
    fi
    
   
}
#6
function Dropuserfromgroup(){
    read -r -p "Drop user from group y/n?" choice
    if [[ $choice == y ]]; 
    then
    read -r -p "user" user
    read -r -p "Group" group
        gpasswd -d $user $group
        if [[ $? > 0 ]]; then
            echo "$?"
            echo "Eroror group already exists"
        else 
            echo "Group drop user complited"
        fi
     else
        echo "Good bay"
    fi

   
}
#7
function Showallusers(){
    read -r -p "You want to list all users y / n? " choice
    if [[ $choice == y ]]; 
    then
        cat /etc/passwd | grep bin/bash
            echo "User complited"
     else
        echo "Good bay"
    fi
   
        
}
function showMenu(){
    exit=true
    while [[ $exit == true ]]
    do
        echo -e "1. Add user\n2.Dell user\n3. Edit user\n4.Create group (with gid)\n5.Add user to group\n6.Drop user from group\n7.Show all user\n0. Exit"
        read -r -p "  " item
        case $item in
        1) userAdd $userAdd;
        ;;
        2)Deleteuser $Deleteuser
    # echo "function user dell"
        ;;
        3)Edituser $Edituser
        ;;
        4)Creategroup $ Creategroup
        echo "Create group (with gid)"
        ;;
        5)Addusergroup $Addusergroup
         echo "Add user to group"
        ;;
        6)Dropuserfromgroup $Dropuserfromgroup
        ;;
        7)Showallusers $Showallusers
        ;;
        0) exit=false
            echo "Good bay";;
        *) echo "Eroor invalid item"
            exit 1
        esac
    done
}

showMenu;
