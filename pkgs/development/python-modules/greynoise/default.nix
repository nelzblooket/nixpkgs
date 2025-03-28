{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  click,
  ansimarkup,
  cachetools,
  colorama,
  click-default-group,
  click-repl,
  dict2xml,
  jinja2,
  more-itertools,
  requests,
  six,
  pytestCheckHook,
  mock,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "greynoise";
  version = "2.3.0";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "GreyNoise-Intelligence";
    repo = "pygreynoise";
    tag = "v${version}";
    hash = "sha256-17NieDQ57qVT2i4S26vLS9N6zALZ+eTtCCcBbhQ8fhQ=";
  };

  propagatedBuildInputs = [
    click
    ansimarkup
    cachetools
    colorama
    click-default-group
    click-repl
    dict2xml
    jinja2
    more-itertools
    requests
    six
  ];

  nativeCheckInputs = [
    pytestCheckHook
    mock
  ];

  pythonImportsCheck = [ "greynoise" ];

  meta = with lib; {
    description = "Python3 library and command line for GreyNoise";
    mainProgram = "greynoise";
    homepage = "https://github.com/GreyNoise-Intelligence/pygreynoise";
    changelog = "https://github.com/GreyNoise-Intelligence/pygreynoise/blob/${src.rev}/CHANGELOG.rst";
    license = licenses.mit;
    maintainers = with maintainers; [ mbalatsko ];
  };
}
