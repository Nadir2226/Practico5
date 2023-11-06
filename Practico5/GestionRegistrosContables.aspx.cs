using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practico5
{
    public partial class GestionRegistrosContables : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                completarTabla();
            }

        }
        protected void completarTabla()
        {
            try {
                DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);

                if (dv != null && dv.Count >0)
                {
                    TableRow headerRow = new TableRow();

                    TableCell headerCell1 = new TableCell();
                    headerCell1.Text = "Cuenta";
                    headerRow.Cells.Add(headerCell1);

                    TableCell headerCell2 = new TableCell();
                    headerCell2.Text = "Monto";
                    headerRow.Cells.Add(headerCell2);

                    TableCell headerCell3 = new TableCell();
                    headerCell3.Text = "Tipo";
                    headerRow.Cells.Add(headerCell3);

                    Table1.Rows.Add(headerRow);

                    foreach (DataRowView rowView in dv) 
                    {
                        DataRow row = rowView.Row;
                        TableRow tableRow = new TableRow();

                        TableCell cell1 = new TableCell();
                        cell1.Text = row["descripcion"].ToString();
                        tableRow.Cells.Add(cell1);

                        TableCell cell2 = new TableCell();
                        cell2.Text = row["monto"].ToString();
                        tableRow.Cells.Add(cell2);

                        TableCell cell3 = new TableCell();
                        cell3.Text = (row["tipo"].ToString() == "True") ? "Haber" : "Debe";
                        tableRow.Cells.Add(cell3);

                        Table1.Rows.Add(tableRow);
                    }



                }
            }
            catch(Exception ex) {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", $"alert('Error');", true);

            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource2.InsertParameters["idCuenta"].DefaultValue = DropDownList1.SelectedValue;
            SqlDataSource2.InsertParameters["monto"].DefaultValue = TextBox1.Text;
            SqlDataSource2.InsertParameters["tipo"].DefaultValue = DropDownList2.SelectedValue;
            int result = SqlDataSource2.Insert();
            if (result > 0)
            {
                Label1.Text = "Se ha agregado " + result.ToString() + " registros";
                completarTabla();
                TextBox1.Text = string.Empty;
            }
            else
            {
                Label1.Text = "No se agregaron registros";
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            
            int result = SqlDataSource2.Delete();
            if (result > 0)
            {
                Label1.Text = "Se ha eliminado " + result.ToString() + " registros";
                completarTabla();
                TextBox1.Text = string.Empty;
            }
            else
            {
                Label1.Text = "No se eliminaron registros";
            }
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
            if (dv != null && dv.Count > 0)
            {
                DataRowView row = dv[0];
                DropDownList1.SelectedValue = row["idCuenta"].ToString();
                TextBox1.Text = row["monto"].ToString();
                DropDownList2.SelectedValue = row["tipo"].ToString();


            }
            completarTabla();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource2.Update();
            if (result > 0)
            {
                Label1.Text = "Se ha modificado " + result.ToString() + " registros";
                completarTabla();
                TextBox1.Text = string.Empty;
            }
            else
            {
                Label1.Text = "No se actualizaron los registros";
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}