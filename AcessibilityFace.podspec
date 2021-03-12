#
# Be sure to run `pod lib lint AcessibilityFace.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AcessibilityFace'
  s.version          = '0.0.1'
  s.summary          = 'Pega a movimentação da face do usuário e cria um cursor virtual no dispositivo. (Somente iphones X ou superior)'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A AcessibilityFaceMouse é um pod com intuito de possibilitar que pessoas com movimentação debilitada dos membros superiores, possam interagir com aplicativos sem a utilização de algum acessório.
  Ele pega a movimentação da face do usuário e cria uma representação desses movimentos em forma de cursor na tela. Ao passar por cima de alguma view, como um botão, ele pode usar gestos para ativar aquela ação.
    Temos quatro tipos de gestos: Piscar olho direito; piscar olho esquerdo; mostrar a língua ou com um comando de voz. Esse comando de voz pode receber quatro ações, a primeira é de toque em algo, segundo de voltar
    na navegação com navigationcontroller, o de próximo e de anterior, para usar em views que tem scroll, como celular e collectionsviews. Para demais ações, deve-se integrar componentes que possam facilitar na hora da utilização
    da aplicação.
    A ação com voz ainda está em fase de testes. O mais recomendado é o da língua, pois tiveram os melhores resultados, diminuindo assim o esforço repetitivo.
    Para utilizar basta mudar a herança de uma classe que herda da viewcontroller  pela AccessibilityFaceAnchorViewController e iniciar os recursos necessarios.
    Para uma melhor utilização do usuário existe a classe AcessibilityGetSensitivityViewController, que tem função de capturar as limitações da face do usuário e assim se adequando ao seu ritmo.
                       DESC

  s.homepage         = 'https://github.com/JBatista1/AcessibilityFace.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'João Batista' => 'j.batista.damasceno@icloud.com' }
  s.source           = { :git => 'https://github.com/JBatista1/AcessibilityFace.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'AcessibilityFace/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AcessibilityFace' => ['AcessibilityFace/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
