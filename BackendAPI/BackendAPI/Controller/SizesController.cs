﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BackendAPI.Models;

namespace BackendAPI.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class SizesController : ControllerBase
    {
        private readonly PizzaContext _context;

        public SizesController(PizzaContext context)
        {
            _context = context;
        }

        // GET: api/Sizes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Size>>> GetSizes()
        {
          if (_context.Sizes == null)
          {
              return NotFound();
          }
          var sizes = await _context.Sizes.Include(a => a.Pizzas).ToListAsync();
            return sizes;
        }

        // GET: api/Sizes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Size>> GetSize(int id)
        {
          if (_context.Sizes == null)
          {
              return NotFound();
          }
            var size = await _context.Sizes.FindAsync(id);

            if (size == null)
            {
                return NotFound();
            }

            return size;
        }

        // PUT: api/Sizes/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutSize(int id, Size size)
        {
            if (id != size.Id)
            {
                return BadRequest();
            }

            _context.Entry(size).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SizeExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Sizes
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Size>> PostSize(Size size)
        {
          if (_context.Sizes == null)
          {
              return Problem("Entity set 'PizzaContext.Sizes'  is null.");
          }
            _context.Sizes.Add(size);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetSize", new { id = size.Id }, size);
        }

        // DELETE: api/Sizes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSize(int id)
        {
            if (_context.Sizes == null)
            {
                return NotFound();
            }
            var size = await _context.Sizes.FindAsync(id);
            if (size == null)
            {
                return NotFound();
            }

            _context.Sizes.Remove(size);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool SizeExists(int id)
        {
            return (_context.Sizes?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
