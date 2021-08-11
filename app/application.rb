class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)


#airline routes

  #airline index
if req.path == ('/airlines') && req.get?
  return [200, {'Content-type' => 'application/json'}, [Airline.all.to_json]]
end


  #airline create
  if req.path == ('/airlines') && req.post?
    body = JSON.parse(req.body.read)
    airline = Airline.create(body)
    return [201, {'Content-Type' => 'application/json'}, [airline.to_json]]
  end

  #airline show
  if req.path.match('/airlines/') && req.get?
    id = req.path.split('/')[2]
    begin
      airline = Airline.find(id)
      return [200, {'Content-Type' => 'application/json'}, [airline.to_json]]
    rescue
      return [404, {'Content-Type' => 'application/json'}, [{message: "Airline not found"}.to_json]]
    end
  end

  #airline update
  if req.path.match('/airlines/') && req.patch?
    id = req.path.split('/')[2]
    body = JSON.parse(req.body.read)
    begin
      airline = Airline.find(id)
      airline.update(body)
      return [202, {'Content-Type' => 'application/json'}, [airline.to_json]]
    end
  end
  #airline delete 

  if req.path.match('/airlines/') && req.delete?
    id = req.path.split('/')[2]
    begin
      airline = Airline.find(id)
      airline.destroy
      return [200, {'Content-Type' => 'application/json'}, [{message: "Airline Destroyed"}.to_json]]
    rescue
      return [404, {'Content-Type' => 'application/json'}, [{message: "Airline not found"}.to_json]]
    end
  end

  #review routes

  #review index

  if req.path == '/reviews' && req.get?
    return [200, {'Content-Type' => 'application/json'}, [Review.all.to_json]]
  end

#review create
if req.path == ('/reviews') && req.post?
  body = JSON.parse(req.body.read)
  review = Review.create(body)
  return [201, {'Content-Type' => 'application/json'}, [review.to_json]]
end

#review show

if req.path.match('/reviews/') && req.get?
  id = req.path.split('/')[2]
  begin
    review = Review.find(id)
    return [200, {'Content-Type' => 'application/json'}, [review.as_json(include: :airlines).to_json]]
  rescue
    return [404, {'Content-Type' => 'application/json'}, [{message: "Airline not found"}.to_json]]
  end
end

#review update

if req.path.match('/reviews/') && req.patch?
  id = req.path.split('/')[2]
  body = JSON.parse(req.body.read)
  begin
    review = Review.find(id)
    review.update(body)
    return [202, {'Content-Type' => 'application/json'}, [review.to_json]]
  end
end

#review delete

if req.path.match('/reviews/') && req.delete?
  id = req.path.split('/')[2]
  begin
    review = Review.find(id)
    review.destroy
    return [200, {'Content-Type' => 'application/json'}, [{message: "Review Destroyed"}.to_json]]
  rescue
    return [404, {'Content-Type' => 'application/json'}, [{message: "Review not found"}.to_json]]
  end
end


    #test route
    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    else
      res.write "Path Not Found"

    end

    res.finish
  end

end
