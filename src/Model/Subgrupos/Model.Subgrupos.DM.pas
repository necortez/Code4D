unit Model.Subgrupos.DM;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Model.Conexao.DM;

type
  TModelSubgruposDM = class(TDataModule)
    QSubGruposCadastro: TFDQuery;
    QSubgruposBusca: TFDQuery;
    QLook: TFDQuery;
    QSubGruposCadastroID: TIntegerField;
    QSubGruposCadastroNOME: TStringField;
    QSubgruposBuscaID: TIntegerField;
    QSubgruposBuscaNOME: TStringField;
    QLookNOME: TStringField;
    procedure QSubGruposCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure SubgruposBuscar(const Acondicao: string);
    procedure CadastrarGet(const AIdSubgrupo: Integer);
    procedure ValidarDadosQueryCadastro;
    procedure LookSubgrupo(const AIdSubgrupo: Integer);
    { Public declarations }
  end;

var
  ModelSubgruposDM: TModelSubgruposDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  Exceptions.FieldName;

{$R *.dfm}

{ TModelCidadesDM }

procedure TModelSubgruposDM.CadastrarGet(const AIdSubgrupo: Integer);
begin
  QSubGruposCadastro.close;
  QSubGruposCadastro.SQL.Clear;
  QSubGruposCadastro.SQL.Add('SELECT * FROM SUBGRUPOS');
  QSubGruposCadastro.SQL.Add('WHERE(ID = :IDSUBGRUPO)');
  QSubGruposCadastro.ParamByName('IDSUBGRUPO').AsInteger := AIdSubgrupo;
  QSubGruposCadastro.Open;
end;

procedure TModelSubgruposDM.SubgruposBuscar(const Acondicao: string);
begin
  QSubgruposBusca.close;
  QSubgruposBusca.SQL.Clear;
  QSubgruposBusca.SQL.Add('SELECT * FROM SUBGRUPOS');
  QSubgruposBusca.SQL.Add(Acondicao);
  QSubgruposBusca.Open;
end;

procedure TModelSubgruposDM.LookSubgrupo(const AIdSubgrupo: Integer);
begin
  QLook.close;
  QLook.ParamByName('IDSUBGRUPO').AsInteger := AIdSubgrupo;
  QLook.Open;
end;

procedure TModelSubgruposDM.QSubGruposCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidarDadosQueryCadastro;
end;

procedure TModelSubgruposDM.ValidarDadosQueryCadastro;
begin
  if(QSubGruposCadastroNOME.AsString.Trim.IsEmpty)then
    raise ExceptionFieldName.Create('Preencha o campo NOME','NOME');

end;


end.
