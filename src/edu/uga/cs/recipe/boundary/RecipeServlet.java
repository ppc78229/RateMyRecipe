package edu.uga.cs.recipe.boundary;

import java.util.List;
import java.util.ArrayList;
import java.io.Writer;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapperBuilder;
import freemarker.template.SimpleHash;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import edu.uga.cs.recipe.persistlayer.PersistenceLayer;
import edu.uga.cs.recipe.objectlayer.*;

/**
 * Servlet implementation class RecipeServlet
 */
@WebServlet("/RecipeServlet")
public class RecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Configuration cfg = null;
	private String templateDir = "/templates";
	private String templateName;
	private SimpleHash root;
	private PersistenceLayer pl;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeServlet() {
        super();
        DefaultObjectWrapperBuilder df = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
		root = new SimpleHash(df.build());
        // TODO Auto-generated constructor stub
    }

    public void init() {
    	// Create your Configuration instance, and specify if up to what FreeMarker
    	// version (here 2.3.25) do you want to apply the fixes that are not 100%
    	// backward-compatible. See the Configuration JavaDoc for details.
    	cfg = new Configuration(Configuration.VERSION_2_3_25);
    	
    	// Specify the source where the template files come from.
		cfg.setServletContextForTemplateLoading(getServletContext(), templateDir);
		
		// Sets how errors will appear.
		// During web page *development* TemplateExceptionHandler.HTML_DEBUG_HANDLER is better.
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		
		// Don't log exceptions inside FreeMarker that it will thrown at you anyway:
		cfg.setLogTemplateExceptions(false);
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		pl = new PersistenceLayer();
		if(request.getParameter("register") != null) { // registration
			handleRegister(request);
		} else if(request.getParameter("login") != null) { // login
			handleLogin(request);
		} else if(request.getParameter("dashboard") != null) { // item on dashboard was selected
			handleDashboard(request);
		} else if(request.getParameter("upload") != null) { // upload recipe was selected
			handleUpload(request);
		} else if(request.getParameter("recipe") != null) { // view recipe info
			prepareRecipePage(request);
		} else if(request.getParameter("vote") != null) { // user vote
			handleVote(request);
		}
		runTemplate(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void runTemplate(HttpServletRequest request, HttpServletResponse response) {
		// You can use this structure for all of your objects to be sent to browser
		Template template = null;
		
		try {
			template = cfg.getTemplate(templateName);
			response.setContentType("text/html");
			Writer out = response.getWriter();
			template.process(root, out);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}
	
	private void handleRegister(HttpServletRequest request) {
		String username = request.getParameter("username");
		String fname = request.getParameter("first_name");
		String lname = request.getParameter("last_name");
		String password = request.getParameter("password");
		pl.addUser(fname, lname, username, password);
		templateName = "index.ftl";
	}
	
	private void handleLogin(HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(pl.checkPassword(username, password)) { // login success
			User user = pl.getUser(username);
			int userID = user.getID();
			root.put("userID", userID);
			templateName = "dashboard.ftl";
		} else { // login failed
			templateName = "index.ftl";
		}
	}

	private void handleDashboard(HttpServletRequest request) {
		String option = request.getParameter("dashboard");
		if(option.equals("Dashboard")) {
			prepareDashboard(request);
		} else if(option.equals("Profile")) {
			prepareProfile(request);
		} else if(option.equals("Upload")) {
			prepareUpload(request);
		} else {
			prepareRecipeList(request, option);
		}
	}
	
	private void handleUpload(HttpServletRequest request) {
		String recipeName = request.getParameter("recipeName");
		String recipeDescr = request.getParameter("recipeDescription");
		String category = request.getParameter("category");
		int userID = Integer.parseInt(request.getParameter("userID"));
		int catID = 0;
		List<Category> cats = pl.getCategories();
		for(Category cat : cats) {
			if(category.contains(cat.getCategory())) {
				catID = cat.getCatID();
				break;
			}
		}
		int recipeID = pl.addRecipe(recipeName, recipeDescr, userID, catID);
		List<String> steps = new ArrayList<String>();
		String[] stepArray = request.getParameterValues("step");
		for(String step : stepArray) {
			steps.add(step);
		}
		pl.addSteps(steps, recipeID);
		root.put("userID", userID);
		templateName = "dashboard.ftl";
	}
	
	private void handleVote(HttpServletRequest request) {
		
	}
	
	private void prepareDashboard(HttpServletRequest request) {
		int userID = Integer.parseInt(request.getParameter("userID"));
		root.put("userID", userID);
		templateName = "dashboard.ftl";
	}
	
	private void prepareProfile(HttpServletRequest request) {
		int userID = Integer.parseInt(request.getParameter("userID"));
		User user = pl.getUser(userID);
		List<Recipe> recipes= pl.getRecipesByUser(userID);
		root.put("userID", userID);
		root.put("user", user);
		root.put("recipes", recipes);
		templateName = "profile.ftl";
	}
	
	private void prepareUpload(HttpServletRequest request) {
		root.put("userID", Integer.parseInt(request.getParameter("userID")));
		templateName = "upload.ftl";
	}
	
	private void prepareRecipeList(HttpServletRequest request, String option) {
		int catID = 0;
		List<Category> cats = pl.getCategories();
		for(Category cat : cats) {
			if(option.contains(cat.getCategory())) {
				catID = cat.getCatID();
				break;
			}
		}
		List<Recipe> recipes = pl.getRecipesByCat(catID);
		root.put("userID", request.getParameter("userID"));
		root.put("recipes", recipes);
		templateName = "recipelist.ftl";
	}
	
	private void prepareRecipePage(HttpServletRequest request) {
		int recipeID = Integer.parseInt(request.getParameter("recipe"));
		Recipe recipe = pl.getRecipe(recipeID);
		List<Step> steps = pl.getSteps(recipeID);
		root.put("userID", request.getParameter("userID"));
		root.put("recipe", recipe);
		root.put("steps", steps);
		templateName = "recipePage.ftl";
	}
	
}
