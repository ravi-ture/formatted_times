module FormatTime

  FORMATTING_OPTIONS = {

    # Date related options

    'YY' => '%Y',
    'CC' => '%C',
    'yy' => '%y',
    'mm' => '%m',
    'BB' => '%B',
    'bb' => '%b',
    'hh' => '%h',
    'dd' => '%d',
    'ee' => '%e',
    'jj' => '%j',

    # Time related options

    'HH' => '%H',
    'kk' => '%k',
    'II' => '%I',
    'll' => '%l',
    'PP' => '%P',
    'pp' => '%p',
    'MM' => '%M',
    'SS' => '%S',
    'LL' => '%L',
    'NN' => '%N',
    '3N' => '%3N',
    '6N' => '%6N',
    '9N' => '%9N',
    '12N' => '%12N',

    # Time zone related Options

    'zz' => '%z',
    '1z' => '%:z',
    '2z' => '%::z',
    '3z' => '%:::z',
    'ZZ' => '%Z',

    # Weekday related options

    'AA' => '%A',
    'aa' => '%a',
    'uu' => '%u',
    'ww' => '%w',
    'GG' => '%G',
    'gg' => '%g',
    'VV' => '%V',
    'UU' => '%U',
    'WW' => '%W',

    # Seconds related opions

    'ss' => '%s',
    'QQ' => '%Q',

    # Literal string related options

    'nn' => '%n',
    'tt' => '%t',

    # Combination Options

    'cc' => '%c',
    'DD' => '%D',
    'FF' => '%F',
    'vv' => '%v',
    'xx' => '%x',
    'XX' => '%X',
    'rr' => '%r',
    'RR' => '%R',
    'TT' => '%T'
  }

  def get_strftime_string(name, *args)
    separator = args[0] || '/'
    multiple_separator=  args[1] || false
    options = name.split('_')
    options.shift

    invalid_options = options - FORMATTING_OPTIONS.keys
    raise ::ArgumentError, "Options #{invalid_options.join(', ')} are invalid." unless invalid_options.empty?

    strf_options = options.collect{ |option| FORMATTING_OPTIONS[option] }
    multiple_separator ? strf_options.zip(separator.chars).flatten.compact.join : strf_options.join(separator)
  end
end