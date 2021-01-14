<%-- 
    Document   : followers
    Created on : Dec 7, 2020, 5:40:33 PM
    Author     : kanchana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/wideSearch.css">
        <link type="text/css" rel="stylesheet" href="css/followers.css">

        <link type="text/css" rel="stylesheet" href="css/navBar.css">
        <link rel="icon" href="images/Capture.PNG" type="image/icon type">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Followers</title>
    </head>
    <body>

        <c:url var="home" value="MemberController">
            <c:param name="command" value="VIEW"/>
            <c:param name="username" value='<%=request.getParameter("username")%>'/>

        </c:url>  

        <h1>Bloƃᴉn.</h1>
        <br>
        <%--navbar--%>
        <div class="topnav" id="mytopnav">
            <a href="${home}" class="active">Home</a>
            <a href="#">Trending</a>
            <div class="dropdown">
                <button class="dropbtn">Categories
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="#">Travel</a>
                    <a href="#">Food</a>
                    <a href="#">Health and Fitness</a>
                    <a href="#">Technology</a>
                    <a href="#">Fashion</a>
                    <a href="#">Music</a>
                    <a href="#">Sports</a>
                    <a href="#">DIY</a>
                </div>
            </div>
            <a href="#">Discover</a>
            <a onclick ="window.location.href = 'changeToBlogger.jsp';" id=post>Post Blog</a>
            <div class="search-container">
                <form action="SearchController" method="GET">
                    <input type="hidden" name="command" value="SEARCH">
                    <input type="text" placeholder="Search.." name="Keyword">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>
            <div class="dropdown2">
                <button class="dropbtn">Profile
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="#">My Profile</a>
                    <a href="#">Notifications</a>
                    <a href="#">Inquiries</a>
                    <a href="#">Account Settings</a>
                    <a id="logout" href="${logout}">Log Out</a>
                </div>
            </div>
            <a href="#" id="right">About us</a>
            <a href="#" id="right">Contact Us</a>
            <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
        </div>
        <%--nav--%>
        <div class="page-wrapper bg-dark p-t-100 p-b-50">
            <h2 style="color: coral; margin-left: 20px;">Follow Suggestions</h2>

            <div class="layout">
                <c:forEach var="tempUser" items="${USERLIST}">
                    <c:url var="followLink" value="FollowServlet">
                        <c:param name="command" value="FOLLOW" />                    
                        <c:param name="follower" value="${tempUser.username}"/>
                        <c:param name="username" value='<%=request.getParameter("username")%>'/>
                    </c:url>  
                    <c:url var="viewLink" value="FollowServlet">
                        <c:param name="command" value="VIEWPAGE" />   
                        <c:param name="username" value="${tempUser.username}"/>

                    </c:url> 
                    <c:url var="action" value="BloggerController">
                        <c:param name="command" value="VIEWPROFILE" />
                        <c:param name="username" value="${Users.username}"/>
                        <c:param name="firstName" value="${Users.firstName}"/>
                        <c:param name="lastName" value="${Users.lastName}"/>
                        <c:param name="email" value="${Users.username}"/>
                        <c:param name="photoURL" value="${Users.photoUrl}"/>

                    </c:url>


                    <div class="profile_follow">

                        <div class="profile__picture"> <img src="${tempUser.password}"></div>

                        <div class="profile__header">
                            <div class="profile__account">
                                <h4 class="username" style="margin-left: 30px;">${tempUser.username}</h4>
                            </div>


                        </div>
                        <div class="profile__stats">

                            <div class="profile__stat">
                                <div class="profile__icon profile__icon--blue"></div>
                                <div class="profile__value">
                                    <div class="profile__key"></div>
                                    <div class="followbtn"><a class="follow_button" href="${followLink}">Follow</a></div>
                                </div>
                                <div class="profile__value">
                                    <div class="prfbtn"><a class="profile_button" href = "${viewLink}">View Profile</a></div>
                                </div>
                            </div>

                        </div>
                    </div>

                </c:forEach>

            </div>



        </div>


        <h2 style="color: coral; margin-left: 20px;">Following</h2>
        <div class="layout-following">
            <c:forEach var="tempFollowers" items="${FOLLOWERSLIST}">
                <c:url var="viewLink" value="FollowServlet">
                    <c:param name="command" value="VIEWPAGE" />  
                    <c:param name="username" value="${tempFollowers.followers}"/>
                </c:url>
                <c:url var="action" value="BloggerController">
                    <c:param name="command" value="VIEWPROFILE" />
                    

                </c:url>
                <div class="profile_follow">

                    <div class="profile__picture"> <img src="${tempFollowers.photoUrl} "></div>

                    <div class="profile__header">
                        <div class="profile__account">
                            <h4 class="username" style="margin-left: 30px;">${tempFollowers.followers}</h4>
                        </div>


                    </div>
                    <div class="profile__stats">

                        <div class="profile__stat">
                            <div class="profile__icon profile__icon--blue"></div>
                            <div class="profile__value">
                                <div class="status">${tempFollowers.status}</div>
                            </div>

                            <div class="profile__value">
                                <div class="prfbtn"><a class="profile_button" href = "${viewLink}">View Profile</a></div>
                            </div>

                        </div>

                    </div>
                </div>
            </c:forEach>
        </div>


    </body>

</html>
