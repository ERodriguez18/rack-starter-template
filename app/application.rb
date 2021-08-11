class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)


#airline routes

  #airline index
if req.path.match('/airlines') && req.get?
  return [200, {'Content-type' => 'application/json'}, [Airline.all.to_json]]
end


  #airline create

  #airline show

  #airline update

  #airline delete 









    #test route
    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    else
      res.write "Path Not Found"

    end

    res.finish
  end

end
