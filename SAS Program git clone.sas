data _null_;
    rc = git_clone(                   /*1*/
     "https://github.com/sassoftware/sas-studio-custom-steps.git", 
     "/sasuser/SAS custom steps");                /*2*/
    put rc=;
run;

data _null_;
    rc = GIT_CLONE ("https://github.com/aylamr/ATE_GIT.git", 
'/sasuser/ATE_GIT', 
'yulia-paramonova', 
'password', '');               
    put rc=;
run;


