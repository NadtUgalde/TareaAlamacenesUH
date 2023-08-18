<%@ Page Title="" Language="C#" MasterPageFile="~/menuMaster.master" AutoEventWireup="true" CodeBehind="FrmProductos.aspx.cs" Inherits="AlamacenesUH.FrmProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <div>
                <label for="Producto">Producto:</label>
                <asp:TextBox ID="tproducto" runat="server" OnTextChanged="tproducto_TextChanged"></asp:TextBox>
            </div>
            <div>
                <label for="Nombre">Nombre:</label>
                <asp:TextBox ID="tnombre" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="Precio">Precio:</label>
                <asp:TextBox ID="tprecio" runat="server"></asp:TextBox>
            </div>
            <div class="button-container">
                <asp:Button ID="BAgregar" CssClass="button button1" runat="server" Text="Agregar" OnClick="BAgregar_Click" />
                <asp:Button ID="BBorrar" CssClass="button button1" runat="server" Text="Borrar" OnClick="BBorrar_Click" />
                <asp:Button ID="BModificar" CssClass="button button1" runat="server" Text="Modificar" OnClick="BModificar_Click" />
                <asp:Button ID="BConsultar" CssClass="button button1" runat="server" Text="Consultar" />
            </div>
        </div>

        <div cssclass="rigth">
            <h2 align="center">Lista de Productos</h2>
            <table id="productosListTable" style="border: thin solid #666666; background-color: #2c2d2f; background-repeat: inherit; border-radius: 4px">
                <thead cssclass="table">
                    <tr>
                        <th class="auto-style2">Id Producto</th>
                        <th class="auto-style2">Nombre</th>
                        <th class="auto-style2">Precio</th>
                    </tr>
                    <asp:Repeater runat="server" ID="repeaterproductos">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Id") %></td>
                                <td><%# Eval("Nombre") %></td>
                                <td><%# Eval("Precio") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </thead>
            </table>
        </div>
        <div class="footer">
            Copyright &copy; Valeria Ugalde y Bryan Leiva - Todos los derechos 2023
        </div>
</asp:Content>
