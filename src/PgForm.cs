using System;
using Gtk;
using System.Text;
using System.Data;
using Npgsql;
using NpgsqlTypes;

namespace PgForm {
class PgForm : Window {
Label lbMsg = new Label("DEBUG: ");
Entry txtNameFunction = new Entry();
Entry txtArg = new Entry();

public PgForm() : base("Ejecutar funciones"){
BorderWidth = 8;
SetDefaultSize(208,220);
this.DeleteEvent += new DeleteEventHandler(OnWindowDelete);
Frame frame = new Frame ("Ejecutar funciones");
Add (frame);
VBox MainPanel = new VBox (false, 8);
MainPanel.BorderWidth = 8;
frame.Add (MainPanel);
MainPanel.PackStart(new Label("Nombre de la funcion"),false,false,0);
MainPanel.PackStart(txtNameFunction,false,false,0);
MainPanel.PackStart(new Label("Si recibe un argumento de tipo varchar")
                    ,false,false,0);
MainPanel.PackStart(txtArg,false,false,0);
Button btnSubmit = new Button("Ejecutar funcion");
btnSubmit.Clicked += new EventHandler(btnSubmitClicked);
MainPanel.PackStart(btnSubmit,false,false,0);
MainPanel.PackStart(lbMsg,false,false,0);
lbMsg.LineWrap = true;
ShowAll();
}

public void OnWindowDelete(object o, DeleteEventArgs args) {
Application.Quit();	
}

void btnSubmitClicked(object o, EventArgs args){
string cStr = "Server=127.0.0.1;Port=5432;User Id=postgres;" + 
	"Password=postgres;Database=pubs;";
try{
using(NpgsqlConnection conn = new NpgsqlConnection(cStr))
{
conn.Open();
NpgsqlCommand cmd = new NpgsqlCommand(txtNameFunction.Text, conn);
cmd.CommandType = System.Data.CommandType.StoredProcedure;
//en caso de tener un parametro como en nuestra funcion de ejemplo
if(txtArg.Text.Length > 0){
cmd.Parameters.Add(new NpgsqlParameter());
cmd.Parameters[0].NpgsqlDbType = NpgsqlDbType.Varchar;
cmd.Parameters[0].Value = txtArg.Text;
}
lbMsg.Text += cmd.ExecuteScalar().ToString();
}}catch(Exception e){
lbMsg.Text += e.Message;
}
}

static void Main(string[] args) {
Application.Init();
new PgForm();
Application.Run();
}}  
}