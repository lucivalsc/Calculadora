unit untComum;

interface

uses
  System.SysUtils;

type
  TComum = class
  public
    class function QuantidadeRepeticao(const Caracter: string; Texto: string): Integer;
    class function TeclaBackSpace(Valor: string): string;
    class function ResultadoVisor(Valor: string): string;
  end;

implementation

{ TComum }

//Contar a quantidade de vezes que um determinado caracterer � inserido na string
class function TComum.QuantidadeRepeticao(const Caracter: string; Texto: string): Integer;
begin
  if (Length(Caracter) = 0) or (Length(Texto) = 0) or (Pos(Caracter, Texto) = 0) then
    Result := 0
  else
    Result := (Length(Texto) - Length(StringReplace(Texto, Caracter, '', [rfReplaceAll]))) div Length(Caracter);
end;

//Tratar a inser��o da v�rgula
//Se a v�rgula for inserida uma vez, ela � tratada para continuar no visor,
//se digitar mais de uma vez a segunda � removida
class function TComum.ResultadoVisor(Valor: string): string;
var
  P: Integer;
begin
  P := TComum.QuantidadeRepeticao(',', Valor);
  if (P = 1) and (Valor <> '0') then
    Result := Valor
  else if (P > 1) then
    Result := Copy(Valor, 1, Length(Valor) - 1)
  else
    Result := FloatToStr(StrToFloatDef(Valor, 0));
end;

//Fun��o para apagar o digito do visor, conforme clicar no bot�o de apagar
class function TComum.TeclaBackSpace(Valor: string): string;
begin
  if Length(Valor) > 1 then
    Result := Copy(Valor, 1, Length(Valor) - 1)
  else
    Result := '0';
end;

end.

