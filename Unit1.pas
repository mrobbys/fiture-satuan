unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    ZConnection1: TZConnection;
    ZSatuan: TZQuery;
    DataSource1: TDataSource;
    Button5: TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a: string;

implementation

{$R *.dfm}

procedure TForm1.Button4Click(Sender: TObject);
begin
Edit1.Clear;
Edit2.Clear;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
ZSatuan.SQL.Clear;
ZSatuan.SQL.Add('INSERT INTO satuan (nama, diskripsi) VALUES (:nama, :diskripsi)');
ZSatuan.ParamByName('nama').AsString := Edit1.Text;
ZSatuan.ParamByName('diskripsi').AsString := Edit2.Text;
ZSatuan.ExecSQL;
Edit1.Clear;
Edit2.Clear;
ZSatuan.SQL.Clear;
ZSatuan.SQL.Add('select * from satuan');
ZSatuan.Open;
ShowMessage('Data satuan berhasil ditambahkan!');
Zsatuan.Refresh;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
ZSatuan.SQL.Clear;
ZSatuan.SQL.Add('delete from satuan where id= "'+a+'"');
ZSatuan.ExecSQL;
Edit1.Clear;
Edit2.Clear;
ZSatuan.SQL.Clear;
ZSatuan.SQL.Add('select * from satuan');
ZSatuan.Open;
ShowMessage('Data satuan berhasil diperbarui!');
Zsatuan.Refresh;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
Edit1.Text:= ZSatuan.Fields[1].AsString;
Edit2.Text:= ZSatuan.Fields[2].AsString;
a:= ZSatuan.Fields[0].AsString;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
ZSatuan.SQL.Clear;
Zsatuan.SQL.Add('update satuan set nama="'+Edit1.Text+'",diskripsi="'+Edit2.Text+'" where id="'+a+'"');
ZSatuan.ExecSQL;

ZSatuan.SQL.Clear;
ZSatuan.SQL.Add('select * from satuan');
ZSatuan.Open;
ShowMessage('Data satuan berhasil diperbarui!');
Zsatuan.Refresh;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
close();
end;

end.
