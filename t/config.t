use Test::Nginx::Socket 'no_plan';

run_tests();

__DATA__

=== TEST 1: dying on bad security_headers value
--- http_config
    security_headers bad;
--- config
--- must_die
--- error_log
invalid value "bad" in "security_headers" directive, it must be "on" or "off"


=== TEST 2: dying on bad x_xss_protection value
--- http_config
    security_headers_x_xss_protection invalid;
--- config
--- must_die
--- error_log
invalid value "invalid" in "security_headers_x_xss_protection" directive


=== TEST 3: dying on bad x_frame_options value
--- http_config
    security_headers_x_frame_options invalid;
--- config
--- must_die
--- error_log
invalid value "invalid" in "security_headers_x_frame_options" directive


=== TEST 4: dying on bad referrer_policy value
--- http_config
    security_headers_referrer_policy invalid;
--- config
--- must_die
--- error_log
invalid value "invalid" in "security_headers_referrer_policy" directive


=== TEST 5: dying on bad x_content_type_options value
--- http_config
    security_headers_x_content_type_options invalid;
--- config
--- must_die
--- error_log
invalid value "invalid" in "security_headers_x_content_type_options" directive


=== TEST 6: dying on bad hsts value
--- http_config
    hsts invalid;
--- config
--- must_die
--- error_log
invalid value "invalid" in "hsts" directive


=== TEST 7: valid x_xss_protection values
--- http_config
    security_headers_x_xss_protection off;
--- config
--- must_not_die


=== TEST 8: valid x_frame_options values
--- http_config
    security_headers_x_frame_options deny;
--- config
--- must_not_die


=== TEST 9: valid referrer_policy values
--- http_config
    security_headers_referrer_policy same-origin;
--- config
--- must_not_die


=== TEST 10: valid x_content_type_options values
--- http_config
    security_headers_x_content_type_options nosniff;
--- config
--- must_not_die
