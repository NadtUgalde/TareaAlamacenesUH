<%@ Page Title="" Language="C#" MasterPageFile="~/menuMaster.master" AutoEventWireup="true" CodeBehind="FrmOrdenes.aspx.cs" Inherits="AlamacenesUH.FrmOrdene" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <div>
                <label for="Orden">Orden:</label>
                <asp:TextBox ID="torden" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="Cliente">ID Cliente:</label>
                <asp:TextBox ID="tcliente" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="Fecha">Fecha:</label>
                <asp:TextBox ID="tfecha" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="Total">Total:</label>
                <asp:TextBox ID="ttotal" runat="server"></asp:TextBox>
            </div>
            <div class="button-container">
                <asp:Button ID="BAgregar" CssClass="button button1" runat="server" Text="Agregar" OnClick="BAgregar_Click" />
                <asp:Button ID="BBorrar" CssClass="button button1" runat="server" Text="Borrar" OnClick="BBorrar_Click" />
                <asp:Button ID="BModificar" CssClass="button button1" runat="server" Text="Modificar" OnClick="BModificar_Click" />
                <asp:Button ID="BConsultar" CssClass="button button1" runat="server" Text="Consultar" />
            </div>
        </div>

        <div cssclass="rigth">
            <h2 align="center">Lista de Ordenes</h2>
            <table id="ordenesListTable" style="border: thin solid #666666; background-color: #2c2d2f; background-repeat: inherit; border-radius: 4px">
                <thead cssclass="table">
                    <tr>
                        <th class="auto-style2">Id Ordenes</th>
                        <th class="auto-style2">Id Clientes</th>
                        <th class="auto-style2">Fecha</th>
                        <th class="auto-style2">Total</th>
                    </tr>
                    <asp:Repeater runat="server" ID="repeaterordenes">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Id") %></td>
                                <td><%# Eval("Cliente") %></td>
                                <td><%# Eval("Fecha") %></td>
                                <td><%# Eval("Total") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </thead>
            </table>
        </div>      
        <div class="footer">Copyright &copy; Valeria Ugalde y Bryan Leiva - Todos los derechos 2023</div>
    </form>
</asp:Content>
