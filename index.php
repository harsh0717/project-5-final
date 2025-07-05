<?php
session_start();
include "db_conn.php";
include "php/func-book.php";
$books = get_all_books($conn); // Make sure 'description' column is fetched here
include "php/func-author.php";
$authors = get_all_author($conn);
include "php/func-category.php";
$categories = get_all_categories($conn);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Online Book Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <style>
        * {
            font-family: 'Segoe UI', sans-serif;
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom right, #0f2027, #203a43, #2c5364);
            min-height: 100vh;
            color: #fff;
        }

        .navbar {
            backdrop-filter: blur(10px);
            background-color: rgba(255, 255, 255, 0.08);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .navbar-brand {
            font-weight: bold;
            color: #FFD700 !important;
        }

        .nav-link {
            color: #ddd !important;
        }

        .nav-link:hover {
            color: #fff !important;
        }

        .search-bar {
            margin-top: 2rem;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
        }

        .search-bar input.form-control {
            padding: 1rem;
            border-radius: 50px 0 0 50px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            outline: none;
            background: rgba(32, 58, 67, 0.6);
            color: #fff;
        }

        .search-bar input.form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .search-bar button {
            border-radius: 0 50px 50px 0;
            border: none;
            background: #FFD700;
            color: #000;
            font-weight: bold;
            padding: 0 25px;
        }

        .filters {
            margin: 2rem auto;
            max-width: 700px;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 10px;
        }

        .filters select {
            padding: 0.6rem 1rem;
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            outline: none;
            width: 48%;
            background: rgba(32, 58, 67, 0.6);
            color: #fff;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cpath fill='none' stroke='%23ffffff' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 0.75rem center;
            background-size: 16px 12px;
        }

        .filters select option {
            background-color: #203a43;
            color: #fff;
        }

        .book-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            padding: 2rem;
        }

        .card {
            background: rgba(255, 255, 255, 0.1);
            border: none;
            border-radius: 20px;
            backdrop-filter: blur(10px);
            overflow: hidden;
            transition: transform 0.3s;
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        /* Style for the link wrapping the image */
        .card img {
            height: 250px;
            object-fit: cover;
            width: 100%;
            display: block; /* Ensure the image behaves as a block within the link */
        }

        .card-img-link {
            display: block; /* Make the link take up the full image area */
            line-height: 0; /* Remove extra space below image */
        }


        .card-body {
            padding: 1rem;
            color: #fff;
            flex-grow: 1;
        }

        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .card-text {
            font-size: 0.9rem;
            margin-bottom: 0.5rem;
        }

        .description-truncated {
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            line-clamp: 3;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: normal;
        }

        .description-full {
            display: block;
        }

        .show-more-btn {
            background: none;
            border: none;
            color: #FFD700;
            font-size: 0.85rem;
            cursor: pointer;
            padding: 0;
            margin-top: 0.5rem;
            text-align: left;
        }

        .show-more-btn:hover {
            text-decoration: underline;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            padding: 0.8rem 1rem;
            background: transparent;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            margin-top: auto;
        }

        .btn-open,
        .btn-download {
            padding: 0.4rem 0.8rem;
            font-size: 0.8rem;
            border-radius: 20px;
            border: none;
        }

        .btn-open {
            background-color: #28a745;
            color: white;
        }

        .btn-download {
            background-color: #1e90ff;
            color: white;
        }

        footer {
            text-align: center;
            margin: 3rem auto 1rem;
            color: #bbb;
            font-size: 0.9rem;
        }

        @media (max-width: 768px) {
            .filters select {
                width: 100%;
            }
        }
    </style>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-dark px-4 py-3">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">📚 Online Book Store</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.php">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="feedback.php">Feedback</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.php">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.php">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <form action="search.php" method="get" class="search-bar d-flex justify-content-center">
        <input type="text" name="key" class="form-control" placeholder="Search books, authors, or categories..." required>
        <button type="submit"><i class="fas fa-search"></i></button>
    </form>

    <div class="filters">
        <select onchange="location = this.value;">
            <option value="index.php">All Categories</option>
            <?php foreach ($categories as $category) { ?>
                <option value="category.php?id=<?= $category['id'] ?>"><?= htmlspecialchars($category['name']) ?></option>
            <?php } ?>
        </select>

        <select onchange="location = this.value;">
            <option value="index.php">All Authors</option>
            <?php foreach ($authors as $author) { ?>
                <option value="author.php?id=<?= $author['id'] ?>"><?= htmlspecialchars($author['name']) ?></option>
            <?php } ?>
        </select>
    </div>

    <div class="container">
        <?php if (empty($books)) { ?>
            <div class="text-center text-light mt-5">
                <h4>No books found in the library.</h4>
                <i class="fas fa-book-open fa-3x mt-3"></i>
            </div>
        <?php } else { ?>
            <div class="book-grid">
                <?php foreach ($books as $book) {
                    $authorName = '';
                    foreach ($authors as $author) {
                        if ($author['id'] == $book['author_id']) {
                            $authorName = $author['name'];
                            break;
                        }
                    }
                    $categoryName = '';
                    foreach ($categories as $cat) {
                        if ($cat['id'] == $book['category_id']) {
                            $categoryName = $cat['name'];
                            break;
                        }
                    }

                    $description = htmlspecialchars($book['description'] ?? 'No description available.');
                    $shortDescription = substr($description, 0, 150);
                    $hasMore = strlen($description) > 150;
                    if ($hasMore) {
                        $shortDescription .= '...';
                    }
                ?>
                    <div class="card">
                        <a href="uploads/cover/<?= htmlspecialchars($book['cover']) ?>" target="_blank" class="card-img-link">
                            <img src="uploads/cover/<?= htmlspecialchars($book['cover']) ?>" class="card-img-top" alt="Book Cover">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title"><?= htmlspecialchars($book['title']) ?></h5>
                            <p class="card-text">
                                <strong>By:</strong> <?= htmlspecialchars($authorName) ?><br>
                                <strong>Category:</strong> <?= htmlspecialchars($categoryName) ?>
                            </p>
                            <div class="book-description">
                                <p class="card-text description-text" id="desc-<?= $book['id'] ?>">
                                    <span class="truncated-content"><?= $shortDescription ?></span>
                                    <span class="full-content" style="display: none;"><?= $description ?></span>
                                </p>
                                <?php if ($hasMore) { ?>
                                    <button class="show-more-btn" data-book-id="<?= $book['id'] ?>">Show More</button>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="uploads/files/<?= htmlspecialchars($book['file']) ?>" target="_blank" class="btn btn-open">Open</a>
                            <a href="uploads/files/<?= htmlspecialchars($book['file']) ?>" download class="btn btn-download">Download</a>
                        </div>
                    </div>
                <?php } ?>
            </div>
        <?php } ?>
    </div>

    <footer>
        &copy; <?= date("Y") ?> Online Book Store. All rights reserved.
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const showMoreButtons = document.querySelectorAll('.show-more-btn');

            showMoreButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const bookId = this.dataset.bookId;
                    const descriptionContainer = document.getElementById(`desc-${bookId}`);
                    const truncatedSpan = descriptionContainer.querySelector('.truncated-content');
                    const fullSpan = descriptionContainer.querySelector('.full-content');

                    if (truncatedSpan.style.display !== 'none') {
                        truncatedSpan.style.display = 'none';
                        fullSpan.style.display = 'inline';
                        this.textContent = 'Show Less';
                        descriptionContainer.classList.remove('description-truncated');
                    } else {
                        truncatedSpan.style.display = 'inline';
                        fullSpan.style.display = 'none';
                        this.textContent = 'Show More';
                        descriptionContainer.classList.add('description-truncated');
                    }
                });
            });
        });
    </script>
</body>

</html>