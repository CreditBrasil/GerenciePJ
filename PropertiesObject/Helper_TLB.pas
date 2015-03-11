unit Helper_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 02/03/2015 17:46:49 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\GerenciePJ\PropertiesObject\Helper.tlb (1)
// LIBID: {7D047377-A622-448B-BDC6-38E7AF80B20A}
// LCID: 0
// Helpfile: 
// HelpString: Helper Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  HelperMajorVersion = 1;
  HelperMinorVersion = 0;

  LIBID_Helper: TGUID = '{7D047377-A622-448B-BDC6-38E7AF80B20A}';

  IID_IProperties: TGUID = '{E4F5654B-4160-47A1-993D-1B1603E0D4C6}';
  CLASS_Properties: TGUID = '{D1B62310-CE86-491C-9807-3E7238B6C641}';
  IID_IAlxProperty: TGUID = '{E2129075-C473-492B-B9B6-8A6735E891C9}';
  CLASS_AlxProperty: TGUID = '{9B71AD53-E3B5-4CAB-A103-507AC36E4BC7}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum EnumTypes
type
  EnumTypes = TOleEnum;
const
  typeString = $00000000;
  typeListaRestrita = $00000001;
  typeNaoSim = $00000002;
  typePasta = $00000003;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IProperties = interface;
  IPropertiesDisp = dispinterface;
  IAlxProperty = interface;
  IAlxPropertyDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Properties = IProperties;
  AlxProperty = IAlxProperty;


// *********************************************************************//
// Interface: IProperties
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E4F5654B-4160-47A1-993D-1B1603E0D4C6}
// *********************************************************************//
  IProperties = interface(IDispatch)
    ['{E4F5654B-4160-47A1-993D-1B1603E0D4C6}']
    function Get_Count: Integer; safecall;
    function Show(const ACaption: WideString): WordBool; safecall;
    function FindByName(const AName: WideString): IAlxProperty; safecall;
    function NewProperty(const AName: WideString; AValue: OleVariant; AType: EnumTypes): IAlxProperty; safecall;
    function Get_Item(AIndexOrName: OleVariant): IAlxProperty; safecall;
    procedure Set_Item(AIndexOrName: OleVariant; const Value: IAlxProperty); safecall;
    property Count: Integer read Get_Count;
    property Item[AIndexOrName: OleVariant]: IAlxProperty read Get_Item write Set_Item; default;
  end;

// *********************************************************************//
// DispIntf:  IPropertiesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E4F5654B-4160-47A1-993D-1B1603E0D4C6}
// *********************************************************************//
  IPropertiesDisp = dispinterface
    ['{E4F5654B-4160-47A1-993D-1B1603E0D4C6}']
    property Count: Integer readonly dispid 201;
    function Show(const ACaption: WideString): WordBool; dispid 204;
    function FindByName(const AName: WideString): IAlxProperty; dispid 205;
    function NewProperty(const AName: WideString; AValue: OleVariant; AType: EnumTypes): IAlxProperty; dispid 202;
    property Item[AIndexOrName: OleVariant]: IAlxProperty dispid 0; default;
  end;

// *********************************************************************//
// Interface: IAlxProperty
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E2129075-C473-492B-B9B6-8A6735E891C9}
// *********************************************************************//
  IAlxProperty = interface(IDispatch)
    ['{E2129075-C473-492B-B9B6-8A6735E891C9}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(Value: OleVariant); safecall;
    function Get_AlxType: EnumTypes; safecall;
    procedure Set_AlxType(Value: EnumTypes); safecall;
    function Get_PickList: WideString; safecall;
    procedure Set_PickList(const Value: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Value: OleVariant read Get_Value write Set_Value;
    property AlxType: EnumTypes read Get_AlxType write Set_AlxType;
    property PickList: WideString read Get_PickList write Set_PickList;
  end;

// *********************************************************************//
// DispIntf:  IAlxPropertyDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E2129075-C473-492B-B9B6-8A6735E891C9}
// *********************************************************************//
  IAlxPropertyDisp = dispinterface
    ['{E2129075-C473-492B-B9B6-8A6735E891C9}']
    property Name: WideString dispid 201;
    property Value: OleVariant dispid 0;
    property AlxType: EnumTypes dispid 203;
    property PickList: WideString dispid 202;
  end;

// *********************************************************************//
// The Class CoProperties provides a Create and CreateRemote method to          
// create instances of the default interface IProperties exposed by              
// the CoClass Properties. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoProperties = class
    class function Create: IProperties;
    class function CreateRemote(const MachineName: string): IProperties;
  end;

// *********************************************************************//
// The Class CoAlxProperty provides a Create and CreateRemote method to          
// create instances of the default interface IAlxProperty exposed by              
// the CoClass AlxProperty. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAlxProperty = class
    class function Create: IAlxProperty;
    class function CreateRemote(const MachineName: string): IAlxProperty;
  end;

implementation

uses ComObj;

class function CoProperties.Create: IProperties;
begin
  Result := CreateComObject(CLASS_Properties) as IProperties;
end;

class function CoProperties.CreateRemote(const MachineName: string): IProperties;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Properties) as IProperties;
end;

class function CoAlxProperty.Create: IAlxProperty;
begin
  Result := CreateComObject(CLASS_AlxProperty) as IAlxProperty;
end;

class function CoAlxProperty.CreateRemote(const MachineName: string): IAlxProperty;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AlxProperty) as IAlxProperty;
end;

end.
