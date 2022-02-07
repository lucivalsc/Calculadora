program Calculadora;

uses
  System.StartUpCopy,
  FMX.Forms,
  CalculadoraView in 'View\CalculadoraView.pas' {frmCalculadora},
  CalculadoraController in 'Controller\CalculadoraController.pas',
  CalculadoraModel in 'Model\CalculadoraModel.pas',
  untComum in 'untComum.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TfrmCalculadora, frmCalculadora);
  Application.Run;
end.

