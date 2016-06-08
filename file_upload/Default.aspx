<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="file_upload._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <input type="file" id="file1" />
    <input type="file" id="file2" />
    <input type="button" value="upload" onclick="upload();" />
    <script type="text/javascript">
        function upload() {
            //debugger;
            var data = new FormData();
            data.append("id", "1");
            data.append("desc", "some text");

            var file1 = $("#file1").get(0).files;
            var file2 = $("#file2").get(0).files;

            // Add the uploaded image content to the form data collection
            if (file1.length > 0) {
                data.append("file1", file1[0]);
            }

            if (file2.length > 0) {
                data.append("file2", file2[0]);
            }

            var request = new XMLHttpRequest();
            request.open("POST", "/FileUpload.asmx/Upload");
            request.send(data);
            
            // jquery version is working with jquery 1.5+
            // Make Ajax request with the contentType = false, and procesDate = false
            //var ajaxRequest = $.ajax({
            //    type: "POST",
            //    url: "/FileUpload.asmx/Upload",
            //    contentType: false,
            //    processData: false,
            //    data: data
            //});
        }
    </script>
</asp:Content>
