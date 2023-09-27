class HomeController < ApplicationController
    def index
        return render status: 200, body: "Fullstack Challenge 20201026"
    end
end