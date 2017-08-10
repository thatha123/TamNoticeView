Pod::Spec.new do |s|
    s.name          =  'TamNoticeView'
    s.version       =  '0.0.1'
    s.summary       =  'A short description of TamNoticeView.'
    s.homepage      =  'https://github.com/thatha123/TamNoticeView'
    s.license       =  'MIT'
    s.authors       = {'Tam' => '1558842407@qq.com'}
    s.platform      =  :ios,'8.0'
    s.source        = {:git => 'https://github.com/thatha123/TamNoticeView.git',:tag => "v#{s.version}" }
    s.source_files  =  'TamNoticeViewDemo/TamNoticeViewDemo/TamNoticeView/*.{h,m}'
    s.resource      =  'TamNoticeViewDemo/TamNoticeViewDemo/TamNoticeView/Resources'
    s.requires_arc  =  true
end
