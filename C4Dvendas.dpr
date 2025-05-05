program C4Dvendas;

uses
  Vcl.Forms,
  View.Principal in 'src\View\View.Principal.pas' {ViewPrincipal},
  Model.Conexao.DM in 'src\Model\Conexao\Model.Conexao.DM.pas' {ModelConexaoDM: TDataModule},
  Model.Subgrupos.DM in 'src\Model\Subgrupos\Model.Subgrupos.DM.pas' {ModelSubgruposDM: TDataModule},
  View.Herancas.Buscar in 'src\View\Herancas\View.Herancas.Buscar.pas' {ViewHerancasBuscar},
  View.Subgrupos.Buscar in 'src\View\Subgrupos\View.Subgrupos.Buscar.pas' {ViewSubgruposBuscar},
  View.Herancas.Cadastrar in 'src\View\Herancas\View.Herancas.Cadastrar.pas' {ViewHerancasCadastrar},
  View.Subgrupos.Cadastrar in 'src\View\Subgrupos\View.Subgrupos.Cadastrar.pas' {ViewSubgruposCadastrar},
  Model.Pessoas.DM in 'src\Model\Pessoas\Model.Pessoas.DM.pas' {ModelPessoasDM: TDataModule},
  View.Pessoas.Buscar in 'src\View\Pessoas\View.Pessoas.Buscar.pas' {ViewPessoasBuscar},
  RTTI.FieldName in 'src\RTTI\RTTI.FieldName.pas',
  Utils in 'src\Utils\Utils.pas',
  Exceptions.FieldName in 'src\Exceptions\Exceptions.FieldName.pas',
  View.Pessoas.Cadastrar in 'src\View\Pessoas\View.Pessoas.Cadastrar.pas' {ViewPessoasCadastrar},
  Model.Cidades.DM in 'src\Model\Cidades\Model.Cidades.DM.pas' {ModelCidadesDM: TDataModule},
  View.Cidades.Buscar in 'src\View\Cidades\View.Cidades.Buscar.pas' {ViewCidadesBuscar},
  View.Cidades.Cadastrar in 'src\View\Cidades\View.Cidades.Cadastrar.pas' {ViewCidadesCadastrar},
  Model.Produtos.DM in 'src\Model\Produtos\Model.Produtos.DM.pas' {ModelProdutosDM: TDataModule},
  View.Produtos.Buscar in 'src\View\Produtos\View.Produtos.Buscar.pas' {ViewProdutosBuscar},
  View.Produtos.Cadastrar in 'src\View\Produtos\View.Produtos.Cadastrar.pas' {ViewProdutosCadastrar},
  View.Vendas in 'src\View\Vendas\View.Vendas.pas' {ViewVendas},
  Model.Vendas.Dm in 'src\Model\Vendas\Model.Vendas.Dm.pas' {ModelVendasDm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Delphi Sistema de Vendas';
  Application.CreateForm(TModelConexaoDM, ModelConexaoDM);
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
