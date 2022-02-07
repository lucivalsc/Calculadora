unit CalculadoraController;

interface

uses
  CalculadoraModel,
  System.StrUtils,
  System.SysUtils;

type
  TCalculadora = class(TCalculadoraModel)
  public
    function CalcularResultado: string;
    function Divisao: string;
  end;

implementation

{ TCalculadora }

function TCalculadora.Divisao: string;
begin
  if Valor2 <> 0 then
    Result := FloatToStr(Valor1 / Valor2)
  else
    Result := 'Não é possível dividir por zero';
end;

function TCalculadora.CalcularResultado: string;
begin
  case AnsiIndexStr(UpperCase(Operacao), ['÷', 'X', '-', '+', '%']) of
    0:
      Result := Divisao;
    1:
      Result := FloatToStr(Valor1 * Valor2);
    2:
      Result := FloatToStr(Valor1 - Valor2);
    3:
      Result := FloatToStr(Valor1 + Valor2);
    4:
      Result := FloatToStr((Valor1 / 100) * Valor2);
  end;
end;

end.

