{
  lib,
  python3,
  fetchFromGitHub,
}:

let
  pname = "tg-archive";
  version = "1.1.3";

in
python3.pkgs.buildPythonApplication {
  inherit pname version;

  src = fetchFromGitHub {
    owner = "knadh";
    repo = "tg-archive";
    tag = "v${version}";
    hash = "sha256-mcobB/z+e4LzEbqELWlUzhbdV5RIM2iImeg9JdVQQZc=";
  };

  pyproject = true;
  pythonRelaxDeps = true;

  propagatedBuildInputs = with python3.pkgs; [
    setuptools
    telethon
    jinja2
    pyyaml
    cryptg
    pillow
    feedgen
    python-magic
    pytz
  ];

  pythonImportsCheck = [
    "tgarchive"
  ];

  meta = {
    description = "A tool for exporting Telegram group chats into static websites like mailing list archives";
    homepage = "https://github.com/knadh/tg-archive";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ euxane ];
    mainProgram = "tg-archive";
  };
}
