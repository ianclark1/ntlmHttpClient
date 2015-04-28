<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>NTLM HTTP Client Test</title>
</head>
<body>

<cfsavecontent variable="variables.content">
	<cfoutput>
    <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                   xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                   xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <GetListItems xmlns="http://schemas.microsoft.com/sharepoint/soap/">
          <strListName>Shared Documents</strListName>
          <strQuery />
          <strViewFields />
          <uRowLimit>100</uRowLimit>
        </GetListItems>
      </soap:Body>
    </soap:Envelope>
  </cfoutput>
</cfsavecontent>

<cfscript>
	variables.ntlmSecuredUrl = 'http://ntlm.secured.com';

	variables.credentials = {};
	variables.credentials.domain = 'YourDomain';
	variables.credentials.username = 'YourUsername';
	variables.credentials.password = 'YourPassword';
	
	variables.ntlmHttpClient = createObject('component','ntlmHttpClient').init(variables.credentials.username
																																						,variables.credentials.password
																																						,variables.credentials.domain);
																																
	variables.ntlmHttpGetResponse = variables.ntlmHttpClient.get(variables.ntlmSecuredUrl);

	variables.ntlmHttpPostResponse = variables.ntlmHttpPostResponse.post(variables.ntlmSecuredUrl,variables.content);
</cfscript>

<cfdump var="#variables.ntlmHttp#" />

<cfdump var="#variables.ntlmHttpGetResponse#" />

<cfdump var="#variables.ntlmHttpPostResponse#"

</body>
</html>