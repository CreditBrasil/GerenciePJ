unit uImgDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList;

{Caso precise de uma imagem e n�o encontre no ImageList, procurar no

C:\delphi\Fac\Desenhos\famfamfam_silk_icons_v013\icons

ou no

http://www.famfamfam.com/lab/icons/silk/

Desta forma mantem-se o padr�o visual.}

type
  TImgDataModule = class(TDataModule)
    ImageList: TImageList;
  end;

var
  ImgDataModule: TImgDataModule;

implementation

{$R *.DFM}

end.
