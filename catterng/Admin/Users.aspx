<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="catterng.Admin.Users" %>
<%@ Import Namespace="catterng" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
    window.onload = function () {
        var seconds = 5;
        setTimeout(function () {
            document.getElementById("<%=lblMsg.ClientID %> ").style.display = "none";
        }, seconds * 1000);
    }; </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="pcoded-inner-content pt-0">
    <div class="align-align-self-end">
        <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
    </div>

    <div class="main-body">
        <div class="page-wrapper">
            <div class="page-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                            </div>
                            <div class="card-block">
                                <div class="row">



                                    
                                    <div class="col-md-12 mobile-inputs">
                                        <h4 class="sub-title">Users Lists</h4>
                                        <div class="card-block table-border-style">
                                            <div class="table-responsive">
                                                <asp:Repeater ID="rUsers" runat="server" OnItemCommand="rUsers_ItemCommand">
                                                    <HeaderTemplate>
                                                        <table id="myDataTable" class="table table-dark data-table-export table-hover nowrap">
                                                            <thead>
                                                                <tr>
                                                                    <td class="table-plus">SrNo</td>
                                                                    <td>Full Name</td>
                                                                    <td>Username</td>
                                                                    <td>Email</td>
                                                                    <td>Joined Date</td>
                                                                    <td class="datatable-nosort">Delete</td>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="table-plus"><%# Eval("SrNo") %></td>
                                                            <td><%# Eval("Name") %></td>
                                                            <td><%# Eval("Username") %></td>
                                                            <td><%# Eval("Email") %></td>
                                                            <td><%# Eval("CreatedDate") %></td>
                                                            <td>
                                                                <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="delete"
                                                                    CssClass="badge badge-danger" CommandArgument='<%# Eval("UserId") %>'
                                                                    OnClientClick="return confirm('Do you want to delete this User?')">
                                                                    <i class="ti-trash"></i>
                                                                </asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
