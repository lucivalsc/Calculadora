unit CalculadoraView;

interface

uses
  untComum,
  CalculadoraController,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Layouts;

type
  TfrmCalculadora = class(TForm)
    Layout1: TLayout;
    Text1: TText;
    txtVisor: TText;
    Layout2: TLayout;
    Layout3: TLayout;
    Path1: TPath;
    txtLimpar: TText;
    pathBackSpace: TPath;
    Path3: TPath;
    Text4: TText;
    Path4: TPath;
    txtDivisao: TText;
    Layout4: TLayout;
    Path5: TPath;
    Text6: TText;
    Path6: TPath;
    Text7: TText;
    Path7: TPath;
    Text8: TText;
    Path8: TPath;
    Text9: TText;
    Layout5: TLayout;
    Path9: TPath;
    Text10: TText;
    Path10: TPath;
    Text11: TText;
    Path11: TPath;
    Text12: TText;
    Path12: TPath;
    Text13: TText;
    Layout6: TLayout;
    Path13: TPath;
    Text14: TText;
    Path14: TPath;
    Text15: TText;
    Path15: TPath;
    Text16: TText;
    Path16: TPath;
    Text17: TText;
    Layout7: TLayout;
    Path17: TPath;
    Text18: TText;
    Path18: TPath;
    Text19: TText;
    Path19: TPath;
    Text20: TText;
    Path20: TPath;
    txtIgual: TText;
    Path21: TPath;
    txtMemoria: TText;
    Line1: TLine;
    procedure txtLimparClick(Sender: TObject);
    procedure Text19Click(Sender: TObject);
    procedure txtDivisaoClick(Sender: TObject);
    procedure txtIgualClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pathBackSpaceClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
  public
    Calculadora: TCalculadora;
    procedure AjustarBotoes;
    procedure ZerarValores;
    procedure LimparCampos;
  end;

var
  frmCalculadora: TfrmCalculadora;

implementation

{$R *.fmx}

procedure TfrmCalculadora.FormCreate(Sender: TObject);
begin
  Calculadora := TCalculadora.Create; //Criar a classe Calculadora
end;

procedure TfrmCalculadora.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Calculadora); //Destruir a classe Calculadora
end;

procedure TfrmCalculadora.FormResize(Sender: TObject);
begin
  AjustarBotoes;
end;

procedure TfrmCalculadora.LimparCampos;
begin
  ZerarValores;
  txtVisor.Text := '0';
  txtMemoria.Text := '';
end;

//Aqui procuro todos os componentes do tipo TPath
//Conforme são encontrados ajusto o tamanho width
//Dessa forma mantenho um padrão de tamanho dos botões
//dentro da tela principal
procedure TfrmCalculadora.AjustarBotoes;
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TPath then
      TPath(Components[I]).Width := (ClientWidth - 64) / 4;
end;

procedure TfrmCalculadora.ZerarValores;
begin
  Calculadora.Valor1 := 0;
  Calculadora.Valor2 := 0;
end;

procedure TfrmCalculadora.pathBackSpaceClick(Sender: TObject);
begin
  txtVisor.Text := TComum.TeclaBackSpace(txtVisor.Text);
end;

//Todos os botões númericos estão vínculados a esse procedimento
//Dessa forma controlo o uso das chamadas através de RTTI
procedure TfrmCalculadora.Text19Click(Sender: TObject);
begin
  txtVisor.Text := TComum.ResultadoVisor(txtVisor.Text + TText(Sender).Text);
end;

procedure TfrmCalculadora.txtIgualClick(Sender: TObject);
begin
  if (Calculadora.Valor1 = 0) and (Calculadora.Valor2 = 0) then
  begin
    LimparCampos;
    Abort;
  end;

  Calculadora.Valor2 := StrToFloat(txtVisor.Text);
  txtMemoria.Text := txtMemoria.Text + ' ' + txtVisor.Text;
  txtVisor.Text := Calculadora.CalcularResultado;
  ZerarValores;
end;

procedure TfrmCalculadora.txtLimparClick(Sender: TObject);
begin
  LimparCampos;
end;

//Todos os botões de operação estão vínculados a esse procedimento
//Dessa forma controlo o uso das chamadas através de RTTI
procedure TfrmCalculadora.txtDivisaoClick(Sender: TObject);
begin
  Calculadora.Operacao := TText(Sender).Text;
  if txtVisor.Text <> '0' then
    Calculadora.Valor1 := StrToFloatDef(txtVisor.Text, 0);
  txtMemoria.Text := FloatToStr(Calculadora.Valor1) + ' ' + TText(Sender).Text;
  txtVisor.Text := '0';
end;

end.

