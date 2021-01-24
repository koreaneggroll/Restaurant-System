#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
//#include <termios.h>

#define MAX_TABLES 15
#define PASSWORD 1122334455
#define ADDRESS "3rd Avenue"
#define REST_NAME "Arin's Rest.";
#define SECRET_PASS "PetrikIsTheBest"
#define CHUNK 1024 //read 1024 bytes at a time


void start();

//Customer struct
struct Customer{
    int order_delivered; //boolean value wheter the order was delievered
    char fname[20]; //first name of the customer
    char order[15]; //order of the customer
    int table; //what table are they at
    int money; //what's their budget
};



struct Customer cus;



//Employee struct
struct Employee{
    char fname[15]; //first name
    char lname[15]; //last name
    int pay;
    enum ranks{Dishwasher, Waiter, Cook, Chef, Manager} ranks; //each rank gets an increased wage
    struct date{
        int dd; //day of birth
        int mm; //month of birth
        int yyyy; //year of birth
    }doj;
};



struct Employee emp;



//Owner Struct
struct Owner{
    char fname[15]; //first name
    char lname[15]; //last name
    int age;
    int pay; //per month in dollars
};



struct Owner owner = {"Arin", "CelMare", 12, 1000};



//Restaurant struct
struct Restaurant{
    char owner_fname[15]; //owner's first name
    char owner_lname[15]; //owner's last name
    char address[15];
    int g_reviews; //good reviews
    int b_reviews; //bad reviews
};



struct Restaurant rest = {"Arin", "Grigoras", ADDRESS};



void mainMesage(){
    printf("####################################\n");
    printf("#\t  Arin's Rest.\t\t   #\n");
    printf("####################################\n");
    
}



void try_password(){
    int pass;
    while(pass != PASSWORD){
        printf("Enter password: ");
        scanf("%d", &pass);
    }
}



/*int getch() {
   struct termios oldtc;
   struct termios newtc;
   int ch;
   tcgetattr(STDIN_FILENO, &oldtc);
   newtc = oldtc;
   newtc.c_lflag &= ~(ICANON | ECHO);
   tcsetattr(STDIN_FILENO, TCSANOW, &newtc);
   ch=getchar();
   tcsetattr(STDIN_FILENO, TCSANOW, &oldtc);
   return ch;
}
*/



//Adds the review to a text file
void g_reviews(){
    FILE *fptr;
    //Open the file
    fptr = fopen("Good_Reviews.txt", "a");

    fprintf(fptr, "\nReview : %d by %s", rest.g_reviews, cus.fname);

    //closes the file
    fclose(fptr);
}



//Adds the review to a text file
void b_reviews(){
    FILE *fptr;
    //opens the file
    fptr = fopen("Bad_Reviews.txt", "a");

    fprintf(fptr, "\nReview : %d by %s", rest.b_reviews, cus.fname);

    //Closes the file
    fclose(fptr);
}



void review(){
    char ch[15];
    //asks the customer a question
    printf("\n\tDo you want to review the restaurant? (yes/no) ");
    scanf("%s", ch);
    int result = strcmp(ch, "yes");

    if(result == 0){
        int review;
        printf("\t1 for a good review and 0 for a bad review: ");
        scanf("%d", &review);

        if(review == 1){
            rest.g_reviews++;
            g_reviews();
        }
        else if(review == 0){
            rest.b_reviews++;
            b_reviews();
        }
        else{
            printf("Error\n");
        }
    }
}



void customer_history(){
    FILE *fptr;
    //Opens the file
    fptr = fopen("Orders.txt", "a");
    fprintf(fptr, "Order : %s, Table : %d, Name %s\n", cus.order, cus.table, cus.fname);
    //closes the file
    fclose(fptr);
}



void normal_menu(){
    int ch;
    int sure;
    int repeat;


    printf("####################################\n");
    printf("#\t  Main Menu\t\t   #\n");
    printf("####################################\n");
    
    
    do{
        printf("\n\t1. Food 1($10)\n");
        printf("\t2. food 2 ($15)\n");
        printf("\t3. food 3 ($5)\n");
        printf("\t4. food 4 ($11)\n");
        printf("\t5. food 5 ($13)\n");
        printf("\t0. EXIT\n");
        printf("\tYour order> ");
        scanf("%d", &ch);

        switch(ch){
            case 1:
                printf("\tYou sure you want to order food 1 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 10;
                    strcpy(cus.order, "food 1");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

            case 2:
                printf("\tYou sure you want to order food 2 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 15;
                    strcpy(cus.order, "food 2");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

            case 3:
                printf("\tYou sure you want to order food 3 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 5;
                    strcpy(cus.order, "food 3");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

            case 4:
                printf("\tYou sure you want to order food 4 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 11;
                    strcpy(cus.order, "food 4");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

            case 5:
                printf("\tYou sure you want to order food 5 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 13;
                    strcpy(cus.order, "food 5");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }
        }
    }while(ch != 0 && repeat == 1);
    start();
}




void vegan_menu(){
    int ch;
    int sure;
    int repeat;

    do{
        printf("\n\tVegan Menu\n\n");
        printf("\n\t1. Vegan food 1($10).\n");
        printf("\t2. Vegan food 2($10).\n");
        printf("\t3. Vegan food 3($10).\n");
        printf("\t4. Vegan food 4($10).\n");
        printf("\t5. Vegan food 5($10)\n");
        printf("\t0. EXIT\n");
        printf("Choice> ");

        scanf("%d", &ch);

        switch(ch){
            case 1:
                printf("\tYou sure you want to order Vegan food 1 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 10;
                    strcpy(cus.order, "Vegan food 1");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

            case 2:
                printf("\tYou sure you want to order Vegan food 2 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 10;
                    strcpy(cus.order, "Vegan food 2");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

            case 3:
                printf("\tYou sure you want to order Vegan food 3 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 10;
                    strcpy(cus.order, "Vegan food 3");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

            case 4:
                printf("\tYou sure you want to order Vegan food 4 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 10;
                    strcpy(cus.order, "Vegan food 4");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

            case 5:
                printf("\tYou sure you want to order Vegan food 5 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 10;
                    strcpy(cus.order, "Vegan food 5");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

        }
    }while(ch != 0 && repeat == 1);
    start();
}



void keto_menu(){
    int ch;
    int sure;
    int repeat;

    do{
        printf("\n\tKeto Menu\n\n");
        printf("\n\t1. Keto food 1($10).\n");
        printf("\t2. Keto food 2($10).\n");
        printf("\t3. Keto food 3($10).\n");
        printf("\t4. Keto food 4($10).\n");
        printf("\t5. Keto food 5($10)\n");
        printf("\t0. EXIT\n");
        printf("Choice> ");

        scanf("%d", &ch);

        switch(ch){
            case 1:
                printf("\tYou sure you want to order Keto food 1 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 10;
                    strcpy(cus.order, "Keto food 1");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

            case 2:
                printf("\tYou sure you want to order Keto food 2 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 10;
                    strcpy(cus.order, "Keto food 2");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

            case 3:
                printf("\tYou sure you want to order Keto food 3 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 10;
                    strcpy(cus.order, "Keto food 3");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

            case 4:
                printf("\tYou sure you want to order Keto food 4 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 10;
                    strcpy(cus.order, "Keto food 4");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

            case 5:
                printf("\tYou sure you want to order Keto food 5 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 10;
                    strcpy(cus.order, "Keto food 5");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

        }
    }while(ch != 0 && repeat == 1);
    start();
}



void Mini_menu(){
    int ch;
    int sure;
    int repeat;

    do{
        printf("\n\tMini Menu\n\n");
        printf("\n\t1. Mini food 1($10).\n");
        printf("\t2. Mini food 2($10).\n");
        printf("\t3. Mini food 3($10).\n");
        printf("\t4. Mini food 4($10).\n");
        printf("\t5. Mini food 5($10)\n");
        printf("\t0. EXIT\n");
        printf("Choice> ");

        scanf("%d", &ch);

        switch(ch){
            case 1:
                printf("\tYou sure you want to order Mini food 1 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 10;
                    strcpy(cus.order, "Mini food 1");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

            case 2:
                printf("\tYou sure you want to order Mini food 2 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 10;
                    strcpy(cus.order, "Mini food 2");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

            case 3:
                printf("\tYou sure you want to order Mini food 3 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 10;
                    strcpy(cus.order, "Mini food 3");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

            case 4:
                printf("\tYou sure you want to order Mini food 4 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 10;
                    strcpy(cus.order, "Mini food 4");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

            case 5:
                printf("\tYou sure you want to order Mini food 5 (1/0) ?");
                scanf("%d", &sure);
                if(sure == 1){
                    cus.money -= 10;
                    strcpy(cus.order, "Mini food 5");
                    printf("\tYour balance: %d\n", cus.money);
                    review();
                    cus.order_delivered = 1;
                    customer_history();
                    printf("\tDo you want to order anything else (1/0) ? ");
                    scanf("%d", &repeat);
                    break;
                }
                else{
                    break;
                }

        }
    }while(ch != 0 && repeat == 1);

    start();

}



void new_employee(){
    //Gets first name
    printf("\nFirst name: ");
    scanf("%s", emp.fname);

    //Gets last name
    printf("Last name: ");
    scanf("%s", emp.lname);
    
    //gets their monthly salary
    printf("Monthly salary: ");
    scanf("%d", &emp.pay);

    //gets their date of birth
    printf("Date of birth in dd/mm/yyyy format:  ");
    scanf("%d/%d/%d", &emp.doj.dd, &emp.doj.mm, &emp.doj.yyyy);

    //check year
    if(emp.doj.yyyy>=1900 && emp.doj.yyyy<=9999)
    {
        //check month
        if(emp.doj.mm>=1 && emp.doj.mm<=12)
        {
            //check days
            if((emp.doj.dd>=1 && emp.doj.dd<=31) && (emp.doj.mm==1 || emp.doj.mm==3 || emp.doj.mm==5 || emp.doj.mm==7 || emp.doj.mm==8 || emp.doj.mm==10 || emp.doj.mm==12))
                printf("Date is valid.\n");
            else if((emp.doj.dd>=1 && emp.doj.dd<=30) && (emp.doj.dd==4 || emp.doj.dd==6 || emp.doj.dd==9 || emp.doj.dd==11))
                printf("Date is valid.\n");
            else if((emp.doj.dd>=1 && emp.doj.dd<=28) && (emp.doj.mm==2))
                printf("Date is valid.\n");
            else if(emp.doj.dd==29 && emp.doj.mm==2 && (emp.doj.yyyy%400==0 ||(emp.doj.yyyy%4==0 && emp.doj.yyyy%100!=0)))
                printf("Date is valid.\n");
            else
                printf("Day is invalid.\n");
        }
        else
        {
            printf("Month is not valid.\n");
        }
    }
    else
    {
        printf("Year is not valid.\n");
    }


    enum ranks rank;

    try_password();

    int ch;
    printf("1. For Dishwasher\n");
    printf("2. For Waiter\n");
    printf("3. For Cook\n");
    printf("4. For Chef\n");
    printf("5. For Manager\n");
    scanf("%d", &ch);

    if(ch == 1){
        rank = Dishwasher;
        emp.pay = 500;
    }
    else if(ch == 2){
        rank = Waiter;
        emp.pay = 1000;
    }
    else if(ch == 3){
        rank = Cook;
        emp.pay = 1500;
    }
    else if(ch == 4){
        rank = Chef;
        emp.pay = 2000;
    }
    else if(ch == 5){
        rank = Manager;
        emp.pay = 2500;
    }
}



//Returns the address of the rest.
char* get_address(){
    return "%s\n", rest.address;
}

//Returns the name of the restaurant
char* get_name(){
    return "%s\n", REST_NAME;
}


//GETS GOOD REVIEWS
void get_g_reviews(){
    char buf[CHUNK];
    FILE *file;
    size_t nread;

    file = fopen("Good_Reviews.txt", "r");
    if (file) {
        while ((nread = fread(buf, 1, sizeof buf, file)) > 0){
            fwrite(buf, 1, nread, stdout);
        }
    if (ferror(file)) {
        printf("Error\n");
    }

    fclose(file);
}

}

//GETS BAD REVIEWS
void get_b_reviews(){
    char buf[CHUNK];
    FILE *file;
    size_t nread;

    file = fopen("Bad_Reviews.txt", "r");
    if(file){
        while((nread = fread(buf, 1, sizeof buf, file)) > 0){
            fwrite(buf, 1, nread, stdout);
        }
    if (ferror(file)){
        printf("Error\n");
    }
    }
}

//The staff menu
void staff_menu(){
    int ch;
    printf("\n\n1. New Employee\n");
    printf("2. Get Address\n");
    printf("3. Get Rest. Name\n");
    printf("4. Check Good Reviews\n");
    printf("5. Check Bad Reviews\n");
    scanf("%d", &ch);

    switch(ch){
        case 1:
            //It checks the password for security reasons
            try_password();
            new_employee();
            break;
        case 2:
            //It checks the password for security reasons
            try_password();
            printf("%s\n", get_address());
            break;
        case 3:
            //It checks the password for security reasons
            try_password();
            printf("%s\n", get_name());
            break;
        case 4:
            //It checks the password for security reasons
            try_password();
            get_g_reviews();
            break;
        case 5:
            //It checks the password for security reasons
            try_password();
            get_b_reviews();
            break;
    }
    
}



void customer(){
    mainMesage();

    //Gets your first name
    printf("\nHello there, what's your name? ");
    scanf("%s", cus.fname);

    //Greets the user
    printf("%s, nice to meet you %s\n", cus.fname, cus.fname);

    //Asks the user for their budget
    printf("If I may ask, what's your budget for the night? ");
    scanf("%d", &cus.money);

    //The customer chooses a table to stay at
    printf("Now, choose a table to stay at from 1 to 15: ");
    scanf("%d", &cus.table);
    if(cus.table > 15){
        printf("Please choose another table\n");
        customer();
    }
    //Hands them the menu using the start() function
    printf("Alright, here's the menu\n");
    
    start();
}



void start(){
    //Sleeps for 2 second
    sleep(2);

    int ch;
    printf("\n1. Normal Menu\n");
    printf("2. Vegan menu\n");
    printf("3. Keto Diets\n");
    printf("4. Mini Foods\n");
    printf("Choice> ");
    scanf("%d", &ch);

    if(ch == 1){
        normal_menu();
    }
    else if(ch == 2){
        vegan_menu();
    }
    else if(ch == 3){
        keto_menu();
    }
    else if(ch == 4){
        Mini_menu();
    }
    //If they put the secret password here they will be prompted to input another password
    else if(ch == PASSWORD){
        char pass[15];
        scanf("%s", pass);
        //This function returns 0 if the input is the same as the password
        int result = strcmp(pass, SECRET_PASS);
        

        if(result == 0){
            staff_menu();
        }
    }
}



int main(void) {
    customer();
}
