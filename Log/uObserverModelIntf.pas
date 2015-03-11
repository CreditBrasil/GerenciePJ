unit uObserverModelIntf;

interface

type
  IObserver = interface
    ['{84130FEB-1701-4F9C-B309-503187BDB58A}']
    procedure UpdateObserver(const ASubject: IUnknown);
  end;

  ISubject = interface
    ['{388095C5-F19F-42C1-AA15-EEF356283A51}']
    procedure AttachObserver(const AObserver: IObserver);
    procedure DetachObserver(const AObserver: IObserver);
    procedure NotifyObservers;
  end;

  IObserverModelFactory = interface
    ['{5C5F5D78-6B56-4A28-A324-9DE2CFB64FA3}']
    function CreateSubject(const AController: IUnknown): ISubject;
  end;

implementation

end.
