unit CalculadoraModel;

interface

type
  TCalculadoraModel = class
  private
    FValor1: Double;
    FValor2: Double;
    FOperacao: string;
    procedure SetOperacao(const Value: string);
    procedure SetValor1(const Value: Double);
    procedure SetValor2(const Value: Double);
  public
    property Operacao: string read FOperacao write SetOperacao;
    property Valor1: Double read FValor1 write SetValor1;
    property Valor2: Double read FValor2 write SetValor2;
  end;

implementation

{ TModeloDados }

procedure TCalculadoraModel.SetOperacao(const Value: string);
begin
  FOperacao := Value;
end;

procedure TCalculadoraModel.SetValor1(const Value: Double);
begin
  FValor1 := Value;
end;

procedure TCalculadoraModel.SetValor2(const Value: Double);
begin
  FValor2 := Value;
end;

end.

