class HomeController < ApplicationController
	skip_filter :ensure_logged_in
end