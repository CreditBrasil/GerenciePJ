unit uImgDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList;

{Caso precise de uma imagem e não encontre no ImageList, procurar no

C:\delphi\Fac\Desenhos\famfamfam_silk_icons_v013\icons

ou no

http://www.famfamfam.com/lab/icons/silk/

Desta forma mantem-se o padrão visual.}

type
  TImgDataModule = class(TDataModule)
    ImageList: TImageList;
  end;

var
  ImgDataModule: TImgDataModule;

implementation

{$R *.DFM}

end.
