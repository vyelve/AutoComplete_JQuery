<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jQueryAutoCompleteTextbox.aspx.cs" Inherits="JqueryAutoComplete.jQueryAutoCompleteTextbox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>jQuery Show Records Found Message in AutoComplete</title>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css">
    <script src="https://code.jquery.com/jquery-1.12.4.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            SearchText();
        });
        function SearchText() {
            $(".autosuggest").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "jQueryAutoCompleteTextbox.aspx/GetAutoCompleteData",
                        data: "{'text':'" + $('#txtSearch').val() + "'}",
                        dataType: "json",
                        success: function (data) {
                            if (data.d.length > 0) {                              
                                response(data.d);
                            }
                            else {
                                alert('No Records Found');
                            }
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                }
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="demo">
            <asp:HiddenField ID="hdnId" runat="server" />
            <div class="ui-widget">
                <label for="tbAuto">Enter Name: </label>
                <input type="text" id="txtSearch" class="autosuggest" />
            </div>
            <div>&nbsp;</div>           
        </div>
    </form>
</body>
</html>
