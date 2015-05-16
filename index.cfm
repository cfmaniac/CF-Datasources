<cfscript>
//CF-Datasources written by JHarvey jharvey@cfmaniac.com
//Fill out the Variables Below:

//CF 9: You can use the hash below:
cf9Hash = '0yJ!@1$r8p0L@r1$6yJ!@1rj';
//CF 10: Open /cfusion/lib/seed.properties to find your CF Seed and Alogrythm:
cf10Seed= '';
cf10Algo= '';
//Put your CFADmin Pass Here
cfAdminPass='';

adminObj = createObject( "component", "cfide.adminapi.administrator" );
adminObj.login( #cfadminpass# );
//java -classpath $CFROOT/lib/cf-logging.jar:$CFROOT/lib/log4j-1.2.15.jar:$CFROOT/lib/cfusion.jar:$CFROOT/lib/xercesImpl.jar:XPath4SAX-0.0.1-SNAPSHOT.jar:. decryptCf11Dsn $CFROOT -p sdgsdgsdgsdg=

// Instantiate the data source object. 
objDS= createObject( "component", "cfide.adminapi.datasource" ).getDataSources();
</cfscript>
<cfoutput>

<table border="1" cellpadding="3" cellspacing="0" width="50%">
<tr>
<th><b>DataSource</b></th>
<th><b>Username</b></th>
<th><b>Password</b></th>
</tr>
<cfloop collection="#objDS#" item="Key">
<cfif len(objDS[Key]["password"])>
<cfif listfirst(server.coldfusion.productversion) is 9>
<cfset password = Decrypt(objDS[Key]["password"],generate3DesKey("#cf9Hash#"), "DESede","Base64") />
<cfelseif listfirst(server.coldfusion.productversion) is 10>
<cfset Password = Decrypt(objDS[Key]["password"],generate3DesKey("#cf10Seed#"),"#cf10Algo#","Base64")> 	
</cfif>


<tr>
<td>#objDS[key].name#</td>
<td>#objDS[key].username#</td>
<td>#password#</td>
</tr>
</cfif>
</cfloop>
</table>
</cfoutput>