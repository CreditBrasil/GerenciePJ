unit MVC_Visao_HTML;

interface

uses
  SysUtils, Classes, Variants, HTTPApp, StringBuilder, MVC_Interfaces, MVC_Visao;

type
  TIcone = (glyphicon_SemIcone, glyphicon_adjust, glyphicon_align_center, glyphicon_align_justify, glyphicon_align_left,
    glyphicon_align_right, glyphicon_arrow_down, glyphicon_arrow_left, glyphicon_arrow_right, glyphicon_arrow_up,
    glyphicon_asterisk, glyphicon_backward, glyphicon_ban_circle, glyphicon_barcode, glyphicon_bell, glyphicon_bold,
    glyphicon_book, glyphicon_bookmark, glyphicon_briefcase, glyphicon_bullhorn, glyphicon_calendar, glyphicon_camera,
    glyphicon_certificate, glyphicon_check, glyphicon_chevron_down, glyphicon_chevron_left, glyphicon_chevron_right,
    glyphicon_chevron_up, glyphicon_circle_arrow_down, glyphicon_circle_arrow_left, glyphicon_circle_arrow_right,
    glyphicon_circle_arrow_up, glyphicon_cloud, glyphicon_cloud_download, glyphicon_cloud_upload, glyphicon_cog,
    glyphicon_collapse_down, glyphicon_collapse_up, glyphicon_comment, glyphicon_compressed, glyphicon_copyright_mark,
    glyphicon_credit_card, glyphicon_cutlery, glyphicon_dashboard, glyphicon_download, glyphicon_download_alt,
    glyphicon_earphone, glyphicon_edit, glyphicon_eject, glyphicon_envelope, glyphicon_euro, glyphicon_exclamation_sign,
    glyphicon_expand, glyphicon_export, glyphicon_eye_close, glyphicon_eye_open, glyphicon_facetime_video,
    glyphicon_fast_backward, glyphicon_fast_forward, glyphicon_file, glyphicon_film, glyphicon_filter, glyphicon_fire,
    glyphicon_flag, glyphicon_flash, glyphicon_floppy_disk, glyphicon_floppy_open, glyphicon_floppy_remove,
    glyphicon_floppy_save, glyphicon_floppy_saved, glyphicon_folder_close, glyphicon_folder_open, glyphicon_font,
    glyphicon_forward, glyphicon_fullscreen, glyphicon_gbp, glyphicon_gift, glyphicon_glass, glyphicon_globe,
    glyphicon_hand_down, glyphicon_hand_left, glyphicon_hand_right, glyphicon_hand_up, glyphicon_hd_video,
    glyphicon_hdd, glyphicon_header, glyphicon_headphones, glyphicon_heart, glyphicon_heart_empty, glyphicon_home,
    glyphicon_import, glyphicon_inbox, glyphicon_indent_left, glyphicon_indent_right, glyphicon_info_sign,
    glyphicon_italic, glyphicon_leaf, glyphicon_link, glyphicon_list, glyphicon_list_alt, glyphicon_lock,
    glyphicon_log_in, glyphicon_log_out, glyphicon_magnet, glyphicon_map_marker, glyphicon_minus, glyphicon_minus_sign,
    glyphicon_move, glyphicon_music, glyphicon_new_window, glyphicon_off, glyphicon_ok, glyphicon_ok_circle,
    glyphicon_ok_sign, glyphicon_open, glyphicon_paperclip, glyphicon_pause, glyphicon_pencil, glyphicon_phone,
    glyphicon_phone_alt, glyphicon_picture, glyphicon_plane, glyphicon_play, glyphicon_play_circle, glyphicon_plus,
    glyphicon_plus_sign, glyphicon_print, glyphicon_pushpin, glyphicon_qrcode, glyphicon_question_sign,
    glyphicon_random, glyphicon_record, glyphicon_refresh, glyphicon_registration_mark, glyphicon_remove,
    glyphicon_remove_circle, glyphicon_remove_sign, glyphicon_repeat, glyphicon_resize_full,
    glyphicon_resize_horizontal, glyphicon_resize_small, glyphicon_resize_vertical, glyphicon_retweet, glyphicon_road,
    glyphicon_save, glyphicon_saved, glyphicon_screenshot, glyphicon_sd_video, glyphicon_search, glyphicon_send,
    glyphicon_share, glyphicon_share_alt, glyphicon_shopping_cart, glyphicon_signal, glyphicon_sort,
    glyphicon_sort_by_alphabet, glyphicon_sort_by_alphabet_alt, glyphicon_sort_by_attributes,
    glyphicon_sort_by_attributes_alt, glyphicon_sort_by_order, glyphicon_sort_by_order_alt, glyphicon_sound_5_1,
    glyphicon_sound_6_1, glyphicon_sound_7_1, glyphicon_sound_dolby, glyphicon_sound_stereo, glyphicon_star,
    glyphicon_star_empty, glyphicon_stats, glyphicon_step_backward, glyphicon_step_forward, glyphicon_stop,
    glyphicon_subtitles, glyphicon_tag, glyphicon_tags, glyphicon_tasks, glyphicon_text_height, glyphicon_text_width,
    glyphicon_th, glyphicon_th_large, glyphicon_th_list, glyphicon_thumbs_down, glyphicon_thumbs_up, glyphicon_time,
    glyphicon_tint, glyphicon_tower, glyphicon_transfer, glyphicon_trash, glyphicon_tree_conifer,
    glyphicon_tree_deciduous, glyphicon_unchecked, glyphicon_upload, glyphicon_usd, glyphicon_user,
    glyphicon_volume_down, glyphicon_volume_off, glyphicon_volume_up, glyphicon_warning_sign, glyphicon_wrench,
    glyphicon_zoom_in, glyphicon_zoom_out);

  THTMLPuro = record
    Conteudo: string;
  end;

  IConverteParaHTMLPuro = interface
    ['{7897A211-AC56-4C26-BD1C-69E629753E04}']
    function HTMLPuro: THTMLPuro;
  end;

  ITagHTMLFluente = interface(IConverteParaHTMLPuro)
    ['{3927F8FC-D0E8-40A2-B498-6C7BFC85E77D}']
    function AddClasse(const AClasse: string): ITagHTMLFluente;
    function RetiraClasse(const AClasse: string): ITagHTMLFluente;
    function SetAtributo(const ANomeAtributo, AConteudo: string): ITagHTMLFluente; overload;
    function SetAtributo(const ANomeAtributo: string; AAtivo: Boolean = True): ITagHTMLFluente; overload;
    function SetClasse(const AClasse: string): ITagHTMLFluente;
    function SetDisabled(ADisabled: Boolean): ITagHTMLFluente;
    function SetFechamento(AFechamento: Boolean): ITagHTMLFluente;
    function SetId(const AId: string): ITagHTMLFluente;
    function SetTag(const ATag: string): ITagHTMLFluente;
  end;

  IHTMLFluente = interface(IConverteParaHTMLPuro)
    ['{9A68E399-6206-415B-AFA2-6A3F03807448}']
    function AddClasse(const AClasse: string): IHTMLFluente;
    function SetAtributo(const ANomeAtributo, AConteudo: string): IHTMLFluente; overload;
    function SetAtributo(const ANomeAtributo: string; AAtivo: Boolean = True): IHTMLFluente; overload;
    function SetClasse(const AClasse: string): IHTMLFluente;
    function SetDentro(const AHTMLPuro: THTMLPuro): IHTMLFluente; overload;
    function SetDentro(const AConverteParaHTMLPuro: IConverteParaHTMLPuro): IHTMLFluente; overload;
    function SetDentro(const AConteudo: string): IHTMLFluente; overload;
    function SetDisabled(ADisabled: Boolean): IHTMLFluente;
    function SetId(const AId: string): IHTMLFluente;
    function SetTag(const ATag: string): IHTMLFluente;
  end;

  IHTMLParcial = interface(IConverteParaHTMLPuro)
    ['{33D584E7-339E-4C9D-8758-8FB7739C07A1}']
    function SetModeloInterface(const AValue: IInterface): IHTMLParcial;
    function SetModeloObject(const AValue: TObject): IHTMLParcial;
    function SetModeloValor(const AValue: Variant): IHTMLParcial;
    function SetParametro(const ANomeParametro: string; const AValorParametro: Variant): IHTMLParcial;
    function SetParametroAsInterface(const ANomeParametro: string; const AValorParametro: IUnknown): IHTMLParcial;
  end;

  IConverteParaHTMLFluente = interface
    ['{E67FE473-C281-4FB1-AFBC-6C87F26B8230}']
    function HTML: IHTMLFluente;
  end;

  TTipoAviso = (taAtencao, taPerigo, taInformacao, taValido);

  TTipoBotao = (tbDefault, tbPrimary, tbSuccess, tbInfo, tbWarning, tbDanger, tbLink);

  TVisaoHTML = class(TVisao)
  private
    FConteudoHTML: TStringBuilder;
    FFabricaTipoDeRota: IFabricaTipoDeRota;
    FResponse: TWebResponse;
    FRota: IRota;
  protected
    function Aviso(const AMensagem: string; ATipoAviso: TTipoAviso): THTMLPuro;
    function AvisoAtencao(const AMensagem: string): THTMLPuro;
    function AvisoInformacao(const AMensagem: string): THTMLPuro;
    function AvisoPerigo(const AMensagem: string): THTMLPuro;
    function AvisoValido(const AMensagem: string): THTMLPuro;
    function Dinheiro(const AValor: Currency): string;
    function Escondido(const ANome, AValor: string): ITagHTMLFLuente;
    function FormularioFim: ITagHTMLFluente;
    function FormularioInicio: ITagHTMLFluente; overload;
    function FormularioInicio(const ARotaFluente: IRotaFluente): ITagHTMLFluente; overload;
    procedure GeraResposta(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
      AResponse: TWebResponse); override;
    function GetConteudo(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
      AResponse: TWebResponse): string; override;
    function GetNomeProjeto: string; virtual;
    function GetTitulo: THTMLPuro;
    function GetTituloPagina: string; virtual;
    procedure HTML; virtual; abstract;
    function NovaRota: IRotaFluente;
    function Parcial(const ANomeControlador, ANomeAcao: string): IHTMLParcial; overload;
    function Parcial(const ANomeAcao: string): IHTMLParcial; overload;
    procedure ProcessaVisao; virtual;
    function RecursoJS(const ARecursoJS: string): IHTMLFLuente;
    function RotaAtual: IRotaFluente;
    function TemaCSS(const ATemaCSS: string): ITagHTMLFluente;
    procedure Write(const AHTML: string);
    procedure WriteLn(const AHTML: string);
    procedure WriteVl(const AConverteParaHTMLFluente: IConverteParaHTMLFluente); overload;
    procedure WriteVl(const AConverteParaHTMLPuro: IConverteParaHTMLPuro); overload;
    procedure WriteVl(const AHTMLPuro: THTMLPuro); overload;
    procedure WriteVl(const ARotaFluente: IRotaFluente); overload;
    procedure WriteVl(const AValor: string); overload;
    procedure WriteVl(const AValor: Variant); overload;
    property FabricaTipoDeRota: IFabricaTipoDeRota read FFabricaTipoDeRota;
    property Response: TWebResponse read FResponse;
    property Rota: IRota read FRota;
  public
    constructor Create; override;
    destructor Destroy; override;
    class function Acao(const ARotaFluente: IRotaFluente; const AHTMLPuro: THTMLPuro): IHTMLFluente; overload;
    class function Acao(const ARotaFluente: IRotaFluente; const ARotulo: string): IHTMLFluente; overload;
    class function Botao(ATipoBotao: TTipoBotao; const ARotaFluente: IRotaFluente; const ARotulo: string;
      AIcone: TIcone = glyphicon_SemIcone): IHTMLFluente;
    class function CodificaParametro(const AParametro: string): string;
    class function HTMLFluente(const ANomeTag: string): IHTMLFluente;
    class function HTMLPuro(const AConteudo: string): THTMLPuro;
    class function Icone(AIcone: TIcone): THTMLPuro;
    class function Iff(ACondicao: Boolean; const AVerdadeiro: string; const AFalso: string = ''): string; overload;
    class function Iff(ACondicao: Boolean; const AVerdadeiro: THTMLPuro): THTMLPuro; overload;
    class function Iff(ACondicao: Boolean; const AVerdadeiro, AFalso: THTMLPuro): THTMLPuro; overload;
    class function PulaLinha(const ATexto: string): THTMLPuro;
    class function Tag(const ANomeTag: string): ITagHTMLFluente;
  end;

implementation

const
  ClasseDoIcone: array [TIcone] of string = (
    '', //glyphicon_SemIcone
    'glyphicon glyphicon-adjust', //glyphicon_adjust
    'glyphicon glyphicon-align-center', //glyphicon_align_center
    'glyphicon glyphicon-align-justify', //glyphicon_align_justify
    'glyphicon glyphicon-align-left', //glyphicon_align_left
    'glyphicon glyphicon-align-right', //glyphicon_align_right
    'glyphicon glyphicon-arrow-down', //glyphicon_arrow_down
    'glyphicon glyphicon-arrow-left', //glyphicon_arrow_left
    'glyphicon glyphicon-arrow-right', //glyphicon_arrow_right
    'glyphicon glyphicon-arrow-up', //glyphicon_arrow_up
    'glyphicon glyphicon-asterisk', //glyphicon_asterisk
    'glyphicon glyphicon-backward', //glyphicon_backward
    'glyphicon glyphicon-ban-circle', //glyphicon_ban_circle
    'glyphicon glyphicon-barcode', //glyphicon_barcode
    'glyphicon glyphicon-bell', //glyphicon_bell
    'glyphicon glyphicon-bold', //glyphicon_bold
    'glyphicon glyphicon-book', //glyphicon_book
    'glyphicon glyphicon-bookmark', //glyphicon_bookmark
    'glyphicon glyphicon-briefcase', //glyphicon_briefcase
    'glyphicon glyphicon-bullhorn', //glyphicon_bullhorn
    'glyphicon glyphicon-calendar', //glyphicon_calendar
    'glyphicon glyphicon-camera', //glyphicon_camera
    'glyphicon glyphicon-certificate', //glyphicon_certificate
    'glyphicon glyphicon-check', //glyphicon_check
    'glyphicon glyphicon-chevron-down', //glyphicon_chevron_down
    'glyphicon glyphicon-chevron-left', //glyphicon_chevron_left
    'glyphicon glyphicon-chevron-right', //glyphicon_chevron_right
    'glyphicon glyphicon-chevron-up', //glyphicon_chevron_up
    'glyphicon glyphicon-circle-arrow-down', //glyphicon_circle_arrow_down
    'glyphicon glyphicon-circle-arrow-left', //glyphicon_circle_arrow_left
    'glyphicon glyphicon-circle-arrow-right', //glyphicon_circle_arrow_right
    'glyphicon glyphicon-circle-arrow-up', //glyphicon_circle_arrow_up
    'glyphicon glyphicon-cloud', //glyphicon_cloud
    'glyphicon glyphicon-cloud-download', //glyphicon_cloud_download
    'glyphicon glyphicon-cloud-upload', //glyphicon_cloud_upload
    'glyphicon glyphicon-cog', //glyphicon_cog
    'glyphicon glyphicon-collapse-down', //glyphicon_collapse_down
    'glyphicon glyphicon-collapse-up', //glyphicon_collapse_up
    'glyphicon glyphicon-comment', //glyphicon_comment
    'glyphicon glyphicon-compressed', //glyphicon_compressed
    'glyphicon glyphicon-copyright-mark', //glyphicon_copyright_mark
    'glyphicon glyphicon-credit-card', //glyphicon_credit_card
    'glyphicon glyphicon-cutlery', //glyphicon_cutlery
    'glyphicon glyphicon-dashboard', //glyphicon_dashboard
    'glyphicon glyphicon-download', //glyphicon_download
    'glyphicon glyphicon-download-alt', //glyphicon_download_alt
    'glyphicon glyphicon-earphone', //glyphicon_earphone
    'glyphicon glyphicon-edit', //glyphicon_edit
    'glyphicon glyphicon-eject', //glyphicon_eject
    'glyphicon glyphicon-envelope', //glyphicon_envelope
    'glyphicon glyphicon-euro', //glyphicon_euro
    'glyphicon glyphicon-exclamation-sign', //glyphicon_exclamation_sign
    'glyphicon glyphicon-expand', //glyphicon_expand
    'glyphicon glyphicon-export', //glyphicon_export
    'glyphicon glyphicon-eye-close', //glyphicon_eye_close
    'glyphicon glyphicon-eye-open', //glyphicon_eye_open
    'glyphicon glyphicon-facetime-video', //glyphicon_facetime_video
    'glyphicon glyphicon-fast-backward', //glyphicon_fast_backward
    'glyphicon glyphicon-fast-forward', //glyphicon_fast_forward
    'glyphicon glyphicon-file', //glyphicon_file
    'glyphicon glyphicon-film', //glyphicon_film
    'glyphicon glyphicon-filter', //glyphicon_filter
    'glyphicon glyphicon-fire', //glyphicon_fire
    'glyphicon glyphicon-flag', //glyphicon_flag
    'glyphicon glyphicon-flash', //glyphicon_flash
    'glyphicon glyphicon-floppy-disk', //glyphicon_floppy_disk
    'glyphicon glyphicon-floppy-open', //glyphicon_floppy_open
    'glyphicon glyphicon-floppy-remove', //glyphicon_floppy_remove
    'glyphicon glyphicon-floppy-save', //glyphicon_floppy_save
    'glyphicon glyphicon-floppy-saved', //glyphicon_floppy_saved
    'glyphicon glyphicon-folder-close', //glyphicon_folder_close
    'glyphicon glyphicon-folder-open', //glyphicon_folder_open
    'glyphicon glyphicon-font', //glyphicon_font
    'glyphicon glyphicon-forward', //glyphicon_forward
    'glyphicon glyphicon-fullscreen', //glyphicon_fullscreen
    'glyphicon glyphicon-gbp', //glyphicon_gbp
    'glyphicon glyphicon-gift', //glyphicon_gift
    'glyphicon glyphicon-glass', //glyphicon_glass
    'glyphicon glyphicon-globe', //glyphicon_globe
    'glyphicon glyphicon-hand-down', //glyphicon_hand_down
    'glyphicon glyphicon-hand-left', //glyphicon_hand_left
    'glyphicon glyphicon-hand-right', //glyphicon_hand_right
    'glyphicon glyphicon-hand-up', //glyphicon_hand_up
    'glyphicon glyphicon-hd-video', //glyphicon_hd_video
    'glyphicon glyphicon-hdd', //glyphicon_hdd
    'glyphicon glyphicon-header', //glyphicon_header
    'glyphicon glyphicon-headphones', //glyphicon_headphones
    'glyphicon glyphicon-heart', //glyphicon_heart
    'glyphicon glyphicon-heart-empty', //glyphicon_heart_empty
    'glyphicon glyphicon-home', //glyphicon_home
    'glyphicon glyphicon-import', //glyphicon_import
    'glyphicon glyphicon-inbox', //glyphicon_inbox
    'glyphicon glyphicon-indent-left', //glyphicon_indent_left
    'glyphicon glyphicon-indent-right', //glyphicon_indent_right
    'glyphicon glyphicon-info-sign', //glyphicon_info_sign
    'glyphicon glyphicon-italic', //glyphicon_italic
    'glyphicon glyphicon-leaf', //glyphicon_leaf
    'glyphicon glyphicon-link', //glyphicon_link
    'glyphicon glyphicon-list', //glyphicon_list
    'glyphicon glyphicon-list-alt', //glyphicon_list_alt
    'glyphicon glyphicon-lock', //glyphicon_lock
    'glyphicon glyphicon-log-in', //glyphicon_log_in
    'glyphicon glyphicon-log-out', //glyphicon_log_out
    'glyphicon glyphicon-magnet', //glyphicon_magnet
    'glyphicon glyphicon-map-marker', //glyphicon_map_marker
    'glyphicon glyphicon-minus', //glyphicon_minus
    'glyphicon glyphicon-minus-sign', //glyphicon_minus_sign
    'glyphicon glyphicon-move', //glyphicon_move
    'glyphicon glyphicon-music', //glyphicon_music
    'glyphicon glyphicon-new-window', //glyphicon_new_window
    'glyphicon glyphicon-off', //glyphicon_off
    'glyphicon glyphicon-ok', //glyphicon_ok
    'glyphicon glyphicon-ok-circle', //glyphicon_ok_circle
    'glyphicon glyphicon-ok-sign', //glyphicon_ok_sign
    'glyphicon glyphicon-open', //glyphicon_open
    'glyphicon glyphicon-paperclip', //glyphicon_paperclip
    'glyphicon glyphicon-pause', //glyphicon_pause
    'glyphicon glyphicon-pencil', //glyphicon_pencil
    'glyphicon glyphicon-phone', //glyphicon_phone
    'glyphicon glyphicon-phone-alt', //glyphicon_phone_alt
    'glyphicon glyphicon-picture', //glyphicon_picture
    'glyphicon glyphicon-plane', //glyphicon_plane
    'glyphicon glyphicon-play', //glyphicon_play
    'glyphicon glyphicon-play-circle', //glyphicon_play_circle
    'glyphicon glyphicon-plus', //glyphicon_plus
    'glyphicon glyphicon-plus-sign', //glyphicon_plus_sign
    'glyphicon glyphicon-print', //glyphicon_print
    'glyphicon glyphicon-pushpin', //glyphicon_pushpin
    'glyphicon glyphicon-qrcode', //glyphicon_qrcode
    'glyphicon glyphicon-question-sign', //glyphicon_question_sign
    'glyphicon glyphicon-random', //glyphicon_random
    'glyphicon glyphicon-record', //glyphicon_record
    'glyphicon glyphicon-refresh', //glyphicon_refresh
    'glyphicon glyphicon-registration-mark', //glyphicon_registration_mark
    'glyphicon glyphicon-remove', //glyphicon_remove
    'glyphicon glyphicon-remove-circle', //glyphicon_remove_circle
    'glyphicon glyphicon-remove-sign', //glyphicon_remove_sign
    'glyphicon glyphicon-repeat', //glyphicon_repeat
    'glyphicon glyphicon-resize-full', //glyphicon_resize_full
    'glyphicon glyphicon-resize-horizontal', //glyphicon_resize_horizontal
    'glyphicon glyphicon-resize-small', //glyphicon_resize_small
    'glyphicon glyphicon-resize-vertical', //glyphicon_resize_vertical
    'glyphicon glyphicon-retweet', //glyphicon_retweet
    'glyphicon glyphicon-road', //glyphicon_road
    'glyphicon glyphicon-save', //glyphicon_save
    'glyphicon glyphicon-saved', //glyphicon_saved
    'glyphicon glyphicon-screenshot', //glyphicon_screenshot
    'glyphicon glyphicon-sd-video', //glyphicon_sd_video
    'glyphicon glyphicon-search', //glyphicon_search
    'glyphicon glyphicon-send', //glyphicon_send
    'glyphicon glyphicon-share', //glyphicon_share
    'glyphicon glyphicon-share-alt', //glyphicon_share_alt
    'glyphicon glyphicon-shopping-cart', //glyphicon_shopping_cart
    'glyphicon glyphicon-signal', //glyphicon_signal
    'glyphicon glyphicon-sort', //glyphicon_sort
    'glyphicon glyphicon-sort-by-alphabet', //glyphicon_sort_by_alphabet
    'glyphicon glyphicon-sort-by-alphabet-alt', //glyphicon_sort_by_alphabet_alt
    'glyphicon glyphicon-sort-by-attributes', //glyphicon_sort_by_attributes
    'glyphicon glyphicon-sort-by-attributes-alt', //glyphicon_sort_by_attributes_alt
    'glyphicon glyphicon-sort-by-order', //glyphicon_sort_by_order
    'glyphicon glyphicon-sort-by-order-alt', //glyphicon_sort_by_order_alt
    'glyphicon glyphicon-sound-5-1', //glyphicon_sound_5_1
    'glyphicon glyphicon-sound-6-1', //glyphicon_sound_6_1
    'glyphicon glyphicon-sound-7-1', //glyphicon_sound_7_1
    'glyphicon glyphicon-sound-dolby', //glyphicon_sound_dolby
    'glyphicon glyphicon-sound-stereo', //glyphicon_sound_stereo
    'glyphicon glyphicon-star', //glyphicon_star
    'glyphicon glyphicon-star-empty', //glyphicon_star_empty
    'glyphicon glyphicon-stats', //glyphicon_stats
    'glyphicon glyphicon-step-backward', //glyphicon_step_backward
    'glyphicon glyphicon-step-forward', //glyphicon_step_forward
    'glyphicon glyphicon-stop', //glyphicon_stop
    'glyphicon glyphicon-subtitles', //glyphicon_subtitles
    'glyphicon glyphicon-tag', //glyphicon_tag
    'glyphicon glyphicon-tags', //glyphicon_tags
    'glyphicon glyphicon-tasks', //glyphicon_tasks
    'glyphicon glyphicon-text-height', //glyphicon_text_height
    'glyphicon glyphicon-text-width', //glyphicon_text_width
    'glyphicon glyphicon-th', //glyphicon_th
    'glyphicon glyphicon-th-large', //glyphicon_th_large
    'glyphicon glyphicon-th-list', //glyphicon_th_list
    'glyphicon glyphicon-thumbs-down', //glyphicon_thumbs_down
    'glyphicon glyphicon-thumbs-up', //glyphicon_thumbs_up
    'glyphicon glyphicon-time', //glyphicon_time
    'glyphicon glyphicon-tint', //glyphicon_tint
    'glyphicon glyphicon-tower', //glyphicon_tower
    'glyphicon glyphicon-transfer', //glyphicon_transfer
    'glyphicon glyphicon-trash', //glyphicon_trash
    'glyphicon glyphicon-tree-conifer', //glyphicon_tree_conifer
    'glyphicon glyphicon-tree-deciduous', //glyphicon_tree_deciduous
    'glyphicon glyphicon-unchecked', //glyphicon_unchecked
    'glyphicon glyphicon-upload', //glyphicon_upload
    'glyphicon glyphicon-usd', //glyphicon_usd
    'glyphicon glyphicon-user', //glyphicon_user
    'glyphicon glyphicon-volume-down', //glyphicon_volume_down
    'glyphicon glyphicon-volume-off', //glyphicon_volume_off
    'glyphicon glyphicon-volume-up', //glyphicon_volume_up
    'glyphicon glyphicon-warning-sign', //glyphicon_warning_sign
    'glyphicon glyphicon-wrench', //glyphicon_wrench
    'glyphicon glyphicon-zoom-in', //glyphicon_zoom_in
    'glyphicon glyphicon-zoom-out' //glyphicon_zoom_out
    );

type
  TTagHTMLFluente = class(TInterfacedObject, IConverteParaHTMLPuro, ITagHTMLFLuente)
  private
    FAtributos: TStringList;
    FFechamento: Boolean;
    FTag: string;
  protected
    { IConverteParaHTMLPuro }
    function HTMLPuro: THTMLPuro;
    { ITagHTMLFLuente }
    function AddClasse(const AClasse: string): ITagHTMLFluente;
    function RetiraClasse(const AClasse: string): ITagHTMLFluente;
    function SetAtributo(const ANomeAtributo, AConteudo: string): ITagHTMLFluente; overload;
    function SetAtributo(const ANomeAtributo: string; AAtivo: Boolean = True): ITagHTMLFluente; overload;
    function SetClasse(const AClasse: string): ITagHTMLFluente;
    function SetDisabled(ADisabled: Boolean): ITagHTMLFluente;
    function SetFechamento(AFechamento: Boolean): ITagHTMLFluente;
    function SetId(const AId: string): ITagHTMLFluente;
    function SetTag(const ATag: string): ITagHTMLFluente;
  public
    constructor Create(const ATag: string);
    destructor Destroy; override;
  end;

  THTMLFluente = class(TInterfacedObject, IConverteParaHTMLPuro, IHTMLFLuente)
  private
    FAtributos: TStringList;
    FDentro: THTMLPuro;
    FTag: string;
  protected
    { IConverteParaHTMLPuro }
    function HTMLPuro: THTMLPuro;
    { IHTMLFLuente }
    function AddClasse(const AClasse: string): IHTMLFluente;
    function SetAtributo(const ANomeAtributo, AConteudo: string): IHTMLFluente; overload;
    function SetAtributo(const ANomeAtributo: string; AAtivo: Boolean = True): IHTMLFluente; overload;
    function SetClasse(const AClasse: string): IHTMLFluente;
    function SetDentro(const AHTMLPuro: THTMLPuro): IHTMLFluente; overload;
    function SetDentro(const AConverteParaHTMLPuro: IConverteParaHTMLPuro): IHTMLFluente; overload;
    function SetDentro(const AConteudo: string): IHTMLFluente; overload;
    function SetDisabled(ADisabled: Boolean): IHTMLFluente;
    function SetId(const AId: string): IHTMLFluente;
    function SetTag(const ATag: string): IHTMLFluente;
  public
    constructor Create(const ATag: string);
    destructor Destroy; override;
  end;

  THTMLParcial = class(TInterfacedObject, IConverteParaHTMLPuro, IHTMLParcial)
  private
    FFabricaTipoDeRota: IFabricaTipoDeRota;
    FResponse: TWebResponse;
    FRota: IRota;
    FVisao: IVisao;
  protected
    { IConverteParaHTMLPuro }
    function HTMLPuro: THTMLPuro;
    { IHTMLParcial }
    function SetModeloInterface(const AValue: IInterface): IHTMLParcial;
    function SetModeloObject(const AValue: TObject): IHTMLParcial;
    function SetModeloValor(const AValue: Variant): IHTMLParcial;
    function SetParametro(const ANomeParametro: string; const AValorParametro: Variant): IHTMLParcial;
    function SetParametroAsInterface(const ANomeParametro: string; const AValorParametro: IUnknown): IHTMLParcial;
  public
    constructor Create(const AVisao: IVisao; const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
      AResponse: TWebResponse);
  end;

{ TTagHTMLFluente }

function TTagHTMLFluente.AddClasse(const AClasse: string): ITagHTMLFluente;
begin
  Result := Self;
  if FAtributos.IndexOfName('class') >= 0 then
    SetClasse(FAtributos.Values['class'] + ' ' + AClasse)
  else
    SetClasse(AClasse);
end;

constructor TTagHTMLFluente.Create(const ATag: string);
begin
  FAtributos := TStringList.Create;
  FTag := ATag;
end;

destructor TTagHTMLFluente.Destroy;
begin
  FAtributos.Free;
  inherited;
end;

function TTagHTMLFluente.HTMLPuro: THTMLPuro;

  function Atributos: string;
  var
    laco: Integer;
    LNome, LValor: string;
  begin
    Result := '';
    for laco := 0 to FAtributos.Count - 1 do
    begin
      LNome := FAtributos.Names[laco];
      LValor := FAtributos.Values[LNome];
      Result := Result + ' ' + LNome;
      if LValor <> '@' then
        Result := Result + '="' + TVisaoHTML.CodificaParametro(LValor) + '"';
    end;
  end;

const
  LStrFechamento: array [Boolean] of string = ('', '/');
begin
  Result := TVisaoHTML.HTMLPuro('<' + LStrFechamento[FFechamento] + FTag + Atributos + '>');
end;

function TTagHTMLFluente.RetiraClasse(const AClasse: string): ITagHTMLFluente;
var
  p, t: Integer;
  LClasse: string;
begin
  Result := Self;
  if FAtributos.IndexOfName('class') >= 0 then
  begin
    LClasse := FAtributos.Values['class'];
    p := Pos(UpperCase(AClasse), UpperCase(LClasse));
    if p > 0 then
    begin
      t := Length(AClasse);
      if Copy(LClasse, p + t, 1) = ' ' then
        Inc(t);
      SetClasse(Copy(LClasse, 1, p - 1) + Copy(LClasse, p + t, MaxInt));
    end;
  end;
end;

function TTagHTMLFluente.SetAtributo(const ANomeAtributo, AConteudo: string): ITagHTMLFluente;
begin
  Result := Self;
  FAtributos.Values[ANomeAtributo] := AConteudo;
end;

function TTagHTMLFluente.SetAtributo(const ANomeAtributo: string; AAtivo: Boolean): ITagHTMLFluente;
const
  LAtivo: array [Boolean] of string = ('', '@');
begin
  Result := SetAtributo(ANomeAtributo, LAtivo[AAtivo]);
end;

function TTagHTMLFluente.SetClasse(const AClasse: string): ITagHTMLFluente;
begin
  Result := SetAtributo('class', AClasse);
end;

function TTagHTMLFluente.SetDisabled(ADisabled: Boolean): ITagHTMLFluente;
begin
  Result := SetAtributo('disabled', ADisabled);
end;

function TTagHTMLFluente.SetFechamento(AFechamento: Boolean): ITagHTMLFluente;
begin
  Result := Self;
  FFechamento := AFechamento;
end;

function TTagHTMLFluente.SetId(const AId: string): ITagHTMLFluente;
begin
  Result := SetAtributo('id', AId);
end;

function TTagHTMLFluente.SetTag(const ATag: string): ITagHTMLFluente;
begin
  Result := Self;
  FTag := ATag;
end;

{ THTMLFluente }

function THTMLFluente.AddClasse(const AClasse: string): IHTMLFluente;
begin
  Result := Self;
  if FAtributos.IndexOfName('class') >= 0 then
    SetClasse(FAtributos.Values['class'] + ' ' + AClasse)
  else
    SetClasse(AClasse);
end;

constructor THTMLFluente.Create(const ATag: string);
begin
  FAtributos := TStringList.Create;
  FTag := ATag;
end;

destructor THTMLFluente.Destroy;
begin
  FAtributos.Free;
  inherited;
end;

function THTMLFluente.HTMLPuro: THTMLPuro;

  function Atributos: string;
  var
    laco: Integer;
    LNome, LValor: string;
  begin
    Result := '';
    for laco := 0 to FAtributos.Count - 1 do
    begin
      LNome := FAtributos.Names[laco];
      LValor := FAtributos.Values[LNome];
      Result := Result + ' ' + LNome;
      if LValor <> '@' then
        Result := Result + '="' + TVisaoHTML.CodificaParametro(LValor) + '"';
    end;
  end;

begin
  Result := TVisaoHTML.HTMLPuro('<' + FTag + Atributos + '>' + FDentro.Conteudo + '</' + FTag + '>');
end;

function THTMLFluente.SetAtributo(const ANomeAtributo, AConteudo: string): IHTMLFluente;
begin
  Result := Self;
  FAtributos.Values[ANomeAtributo] := AConteudo;
end;

function THTMLFluente.SetAtributo(const ANomeAtributo: string; AAtivo: Boolean): IHTMLFluente;
const
  LAtivo: array [Boolean] of string = ('', '@');
begin
  Result := SetAtributo(ANomeAtributo, LAtivo[AAtivo]);
end;

function THTMLFluente.SetClasse(const AClasse: string): IHTMLFluente;
begin
  Result := SetAtributo('class', AClasse);
end;

function THTMLFluente.SetDentro(const AHTMLPuro: THTMLPuro): IHTMLFluente;
begin
  Result := Self;
  FDentro := AHTMLPuro;
end;

function THTMLFluente.SetDentro(const AConverteParaHTMLPuro: IConverteParaHTMLPuro): IHTMLFluente;
begin
  Result := SetDentro(AConverteParaHTMLPuro.HTMLPuro);
end;

function THTMLFluente.SetDentro(const AConteudo: string): IHTMLFluente;
begin
  Result := SetDentro(TVisaoHTML.HTMLPuro(HTMLEncode(AConteudo)));
end;

function THTMLFluente.SetDisabled(ADisabled: Boolean): IHTMLFluente;
begin
  Result := SetAtributo('disabled', ADisabled);
end;

function THTMLFluente.SetId(const AId: string): IHTMLFluente;
begin
  Result := SetAtributo('id', AId);
end;

function THTMLFluente.SetTag(const ATag: string): IHTMLFluente;
begin
  Result := Self;
  FTag := ATag;
end;

{ THTMLParcial }

constructor THTMLParcial.Create(const AVisao: IVisao; const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
  AResponse: TWebResponse);
begin
  FVisao := AVisao;
  FFabricaTipoDeRota := AFabricaTipoDeRota;
  FRota := ARota;
  FResponse := AResponse;
end;

function THTMLParcial.HTMLPuro: THTMLPuro;
begin
  Result := TVisaoHTML.HTMLPuro(FVisao.GetConteudo(FFabricaTipoDeRota, FRota, FResponse));
end;

function THTMLParcial.SetModeloInterface(const AValue: IInterface): IHTMLParcial;
begin
  Result := Self;
  FVisao.ModeloInterface := AValue;
end;

function THTMLParcial.SetModeloObject(const AValue: TObject): IHTMLParcial;
begin
  Result := Self;
  FVisao.ModeloObject := AValue;
end;

function THTMLParcial.SetModeloValor(const AValue: Variant): IHTMLParcial;
begin
  Result := Self;
  FVisao.ModeloValor := AValue;
end;

function THTMLParcial.SetParametro(const ANomeParametro: string; const AValorParametro: Variant): IHTMLParcial;
begin
  Result := Self;
  FVisao.Parametros[ANomeParametro] := AValorParametro;
end;

function THTMLParcial.SetParametroAsInterface(const ANomeParametro: string;
  const AValorParametro: IInterface): IHTMLParcial;
begin
  Result := Self;
  FVisao.Parametros.AsInterface[ANomeParametro] := AValorParametro;
end;

{ TVisaoHTML }

class function TVisaoHTML.Acao(const ARotaFluente: IRotaFluente; const AHTMLPuro: THTMLPuro): IHTMLFluente;
begin
  Result := HTMLFLuente('a')
    .SetAtributo('href', ARotaFluente.CriaRota.URL)
    .SetDentro(AHTMLPuro);
end;

class function TVisaoHTML.Acao(const ARotaFluente: IRotaFluente; const ARotulo: string): IHTMLFluente;
begin
  Result := Acao(ARotaFluente, HTMLPuro(HTMLEncode(ARotulo)));
end;

function TVisaoHTML.Aviso(const AMensagem: string; ATipoAviso: TTipoAviso): THTMLPuro;
const
  HTMLClass: array [TTipoAviso] of string = ('alert alert-warning', 'alert alert-danger', 'alert alert-info', 'alert alert-success');
begin
  if AMensagem = '' then
    Result := HTMLPuro('')
  else
    Result := HTMLPuro('<div class="' + HTMLClass[ATipoAviso] + '"><button class="close" data-dismiss="alert">&times;</button>' + HTMLEncode(AMensagem) + '</div>');
end;

function TVisaoHTML.AvisoAtencao(const AMensagem: string): THTMLPuro;
begin
  Result := Aviso(AMensagem, taAtencao);
end;

function TVisaoHTML.AvisoInformacao(const AMensagem: string): THTMLPuro;
begin
  Result := Aviso(AMensagem, taInformacao);
end;

function TVisaoHTML.AvisoPerigo(const AMensagem: string): THTMLPuro;
begin
  Result := Aviso(AMensagem, taPerigo);
end;

function TVisaoHTML.AvisoValido(const AMensagem: string): THTMLPuro;
begin
  Result := Aviso(AMensagem, taValido);
end;

class function TVisaoHTML.Botao(ATipoBotao: TTipoBotao; const ARotaFluente: IRotaFluente; const ARotulo: string;
  AIcone: TIcone): IHTMLFluente;
const
  ClasseBotao: array [TTipoBotao] of string = ('btn btn-default', 'btn btn-primary', 'btn btn-success', 'btn btn-info',
    'btn btn-warning', 'btn btn-danger', 'btn btn-link');
begin
  Result := Acao(ARotaFluente, HTMLPuro(Icone(AIcone).Conteudo + HTMLEncode(ARotulo)))
    .SetClasse(ClasseBotao[ATipoBotao]);
end;

class function TVisaoHTML.CodificaParametro(const AParametro: string): string;
begin
  Result := StringReplace(AParametro, '"', '&quot;', [rfReplaceAll]);
end;

constructor TVisaoHTML.Create;
begin
  inherited;
  FConteudoHTML := TStringBuilder.Create;
end;

destructor TVisaoHTML.Destroy;
begin
  FConteudoHTML.Free;
  inherited;
end;

function TVisaoHTML.Dinheiro(const AValor: Currency): string;
begin
  Result := FormatFloat(',0.00', AValor);
end;

function TVisaoHTML.Escondido(const ANome, AValor: string): ITagHTMLFLuente;
begin
  Result := Tag('input')
    .SetAtributo('type', 'hidden')
    .SetAtributo('name', ANome)
    .SetId(ANome)
    .SetAtributo('value', AValor);
end;

function TVisaoHTML.FormularioFim: ITagHTMLFluente;
begin
 Result := Tag('form').SetFechamento(True);
end;

function TVisaoHTML.FormularioInicio: ITagHTMLFluente;
begin
  Result := FormularioInicio(RotaAtual);
end;

function TVisaoHTML.FormularioInicio(const ARotaFluente: IRotaFluente): ITagHTMLFluente;
begin
  Result := Tag('form')
    .SetAtributo('action', ARotaFluente.URL)
    .SetAtributo('method', 'post')
    .SetAtributo('role', 'form');
end;

procedure TVisaoHTML.GeraResposta(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
  AResponse: TWebResponse);
const
  sDateFormatGMT = sDateFormat + ' "GMT"';
begin
  AResponse.SetCustomHeader('Date', Format(FormatDateTime(sDateFormatGMT, Now), [DayOfWeekStr(Now), MonthStr(Now)]));
  AResponse.SetCustomHeader('Server', AResponse.Server);
  AResponse.SetCustomHeader('X-Powered-By', 'Delphi 7');
  AResponse.SetCustomHeader('Expires', 'Wed, 11 Jan 1984 05:00:00 GMT');
  AResponse.SetCustomHeader('Last-Modified', Format(FormatDateTime(sDateFormatGMT, Now), [DayOfWeekStr(Now), MonthStr(Now)]));
  AResponse.SetCustomHeader('Cache-Control', 'no-cache, must-revalidate, max-age=0');
  AResponse.SetCustomHeader('Pragma', 'no-cache');
  AResponse.Content := GetConteudo(AFabricaTipoDeRota, ARota, AResponse);
end;

function TVisaoHTML.GetConteudo(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
  AResponse: TWebResponse): string;
begin
  FResponse := AResponse;
  FFabricaTipoDeRota := AFabricaTipoDeRota;
  FRota := ARota;
  try
    ProcessaVisao;
    Result := FConteudoHTML.ToString;
  finally
    FRota := nil;
    FFabricaTipoDeRota := nil;
  end;
end;

function TVisaoHTML.GetNomeProjeto: string;
begin
  Result := '';
end;

function TVisaoHTML.GetTitulo: THTMLPuro;
var
  LTituloPagina: string;
begin
  LTituloPagina := GetTituloPagina;
  if LTituloPagina <> '' then
    Result := HTMLPuro(LTituloPagina + ' &rsaquo; ' + GetNomeProjeto)
  else
    Result := HTMLPuro(Rota.NomeControlador + ' &rsaquo; ' + GetNomeProjeto);
end;

function TVisaoHTML.GetTituloPagina: string;
begin
  Result := '';
end;

class function TVisaoHTML.HTMLFluente(const ANomeTag: string): IHTMLFluente;
begin
  Result := THTMLFluente.Create(ANomeTag);
end;

class function TVisaoHTML.HTMLPuro(const AConteudo: string): THTMLPuro;
begin
  Result.Conteudo := AConteudo;
end;

class function TVisaoHTML.Icone(AIcone: TIcone): THTMLPuro;
begin
  if AIcone = glyphicon_SemIcone then
    Result := HTMLPuro('')
  else
    Result := HTMLPuro('<span class="' + ClasseDoIcone[AIcone] + '"></span> ');
end;

class function TVisaoHTML.Iff(ACondicao: Boolean; const AVerdadeiro, AFalso: string): string;
begin
  if ACondicao then
    Result := AVerdadeiro
  else
    Result := AFalso;
end;

class function TVisaoHTML.Iff(ACondicao: Boolean; const AVerdadeiro: THTMLPuro): THTMLPuro;
begin
  Result := Iff(ACondicao, AVerdadeiro, HTMLPuro(''));
end;

class function TVisaoHTML.Iff(ACondicao: Boolean; const AVerdadeiro, AFalso: THTMLPuro): THTMLPuro;
begin
  if ACondicao then
    Result := AVerdadeiro
  else
    Result := AFalso;
end;

function TVisaoHTML.NovaRota: IRotaFluente;
begin
  Result := FabricaTipoDeRota.CriaRotaFluente;
end;

function TVisaoHTML.Parcial(const ANomeControlador, ANomeAcao: string): IHTMLParcial;
var
  LVisao: IVisao;
begin
  LVisao := FabricaVisao.CriaVisao(ANomeControlador, ANomeAcao);
  if LVisao.Parametros <> nil then
    LVisao.Parametros.Assign(Parametros);
  Result := THTMLParcial.Create(LVisao, FabricaTipoDeRota, Rota, FResponse);
end;

function TVisaoHTML.Parcial(const ANomeAcao: string): IHTMLParcial;
begin
  Result := Parcial(Rota.NomeInternoDoControlador, ANomeAcao); 
end;

procedure TVisaoHTML.ProcessaVisao;
begin
  HTML;
end;

class function TVisaoHTML.PulaLinha(const ATexto: string): THTMLPuro;
begin
  Result := HTMLPuro(StringReplace(HTMLEncode(ATexto), #13#10, '<br>'#13#10, [rfReplaceAll]));
end;

function TVisaoHTML.RecursoJS(const ARecursoJS: string): IHTMLFLuente;
begin
  Result := HTMLFluente('script')
    .SetAtributo('src', NovaRota.Nome('Padrao').Controlador('Recurso').Acao('JS').Outros(ARecursoJS + '.js').URL);
end;

function TVisaoHTML.RotaAtual: IRotaFluente;
begin
  Result := FabricaTipoDeRota.CriaRotaFluente(Rota);
end;

class function TVisaoHTML.Tag(const ANomeTag: string): ITagHTMLFluente;
begin
  Result := TTagHTMLFluente.Create(ANomeTag);
end;

function TVisaoHTML.TemaCSS(const ATemaCSS: string): ITagHTMLFluente;
begin
  Result := Tag('link')
		.SetAtributo('href', NovaRota.Nome('Padrao').Controlador('Tema').Acao('CSS').Outros(ATemaCSS + '.css').URL)
		.SetAtributo('rel', 'stylesheet');
end;

procedure TVisaoHTML.Write(const AHTML: string);
begin
  FConteudoHTML.Append(AHTML);
end;

procedure TVisaoHTML.WriteLn(const AHTML: string);
begin
  FConteudoHTML.AppendLine(AHTML);
end;

procedure TVisaoHTML.WriteVl(const AConverteParaHTMLFluente: IConverteParaHTMLFluente);
begin
  WriteVl(AConverteParaHTMLFluente.HTML);
end;

procedure TVisaoHTML.WriteVl(const AConverteParaHTMLPuro: IConverteParaHTMLPuro);
begin
  WriteVl(AConverteParaHTMLPuro.HTMLPuro);
end;

procedure TVisaoHTML.WriteVl(const AHTMLPuro: THTMLPuro);
begin
  Write(AHTMLPuro.Conteudo);
end;

procedure TVisaoHTML.WriteVl(const ARotaFluente: IRotaFluente);
begin
  WriteVl(HTMLPuro(ARotaFluente.URL));
end;

procedure TVisaoHTML.WriteVl(const AValor: string);
begin
  Write(HTMLEncode(AValor));
end;

procedure TVisaoHTML.WriteVl(const AValor: Variant);
var
  LValor: string;
begin
  LValor := AValor;
  WriteVl(LValor);
end;

end.
