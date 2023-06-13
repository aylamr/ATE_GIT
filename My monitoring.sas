/* My Monitoring */
%let libr = lib="swee"; *added after proc cas;
%let tblnm = tblnm="H_M_articles"; *added after proc cas;
%let lib="swee"; *used outside proc cas;

/* Server  */
proc cas; listNodes;	run;quit;
proc cas; builtins.serverStatus;quit;
proc cas; builtins.getLicensedProductInfo;quit;
proc cas; builtins.getLicenseInfo;quit;
proc cas; builtins.actionSetInfo / all=True;quit;
proc cas; builtins.help / actionSet="builtins", action="actionSetInfo";quit;

/* Sessions */
cas mysession listabout;
cas _all_ list; *List all the CAS sessions created or reconnected to by the SAS Client;
cas mysession listsessions;* List all of the CAS sessions known to the CAS server for the userID associated with "mySession". ; 
proc cas; cas mysession listhistory 10; quit;
proc cas; session.sessionStatus;quit;
proc cas; session.metrics / on=True; quit;
proc cas; sessionProp.listSessOpts; quit;
proc cas; * Set and View session options *;
    sessionProp.setSessOpt / timeout=20000, metrics=False;
    sessionProp.getSessOpt / name="metrics";
    sessionProp.getSessOpt / name="timeout";
quit;

/* Data */
proc casutil; list files incaslib=&lib; run; *physical files information ;
/* proc casutil; list tables incaslib=&lib; run; */
proc cas; &libr ; table.tableInfo / caslib=lib; quit; *in-memory table;

/* Table */
proc cas; &libr; &tblnm; table.columnInfo /table={caslib=lib,name=tblnm}; run; /* Get column information */